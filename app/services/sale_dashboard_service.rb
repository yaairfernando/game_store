class SaleDashboardService
  SALE_STATUSES = Sale.statuses
  SALE_TYPE_CATEGORIES = SaleType.categories

  def initialize(params)
    @params = params
    @replace_status_key = ->(key) { key = SALE_STATUSES.find { |_, v| v.eql? key }[0] }
    @replace_category_key = ->(key) { key = SALE_TYPE_CATEGORIES.find {|_, v| v.eql? key }[0] }
  end
  
  def call
    # JOINS
    # @sales = Sale::Common.new(@params, Sale).operations_common_where
    # @sales_by_currency = @sales.includes(:sale_detail).group_by {|e| e.sale_detail.currency }
    # @sales_by_status = @sales.group_by(&:status)
    # @sales_by_category = @sales.includes(:sale_type).group_by {|e| e.sale_type.category }
    
    # MATERIALIZED VIEWS
    SalesReportWorker.perform_async
    @sales = Sale::Common.new(@params, SalesReport).operations_common_where
    @sales_by_currency = @sales.group_by(&:currency)
    @sales_by_status = @sales.group_by(&:status).transform_keys(&@replace_status_key)
    @sales_by_category = @sales.group_by(&:category).transform_keys(&@replace_category_key)
    build_hashes
  end

  def self.refresh
    SalesReport.refresh
  end

  private

  def build_hashes
    {
      sales_by_currency: get_hash_values_size(@sales_by_currency),
      sales_by_status: get_hash_values_size(@sales_by_status),
      sales_by_category: get_hash_values_size(@sales_by_category)
    }
  end

  def get_hash_values_size(hash)
    hash.map { |key, value| [key, value.size] }.to_h
  end
end