class SaleDashboardService

  def self.call
    3.times do 
      Sale.all.each do |sale|
        sale_dup = sale.dup
        sale_dup.sale_detail = sale.sale_detail.dup
        sale_dup.save
      end
    end
    # sales_by_category = {}
    # SalesReport.all.group_by(&:sale_type).each do |key, value|
    #   sales_by_category[key] = value.size
    # end
    # {
    #   completed_national_sales: SalesReport.where(currency: 'MXN', country: 'US', category: 1, status: 0).size,
    #   penging_sales: SalesReport.where(sale_type: 'Commics', status: 2).size,
    #   rejected_sales: SalesReport.where(sale_type: 'Action', status: 3).where('total > ?', 500).size,
    #   sales_by_category: sales_by_category
    # }
  end

  def self.refresh
    SalesReport.refresh
  end

  private

  def build_hashes
    {
      completed_national_sales: SalesReport.where(currency: 'MXN', country: 'US', category: 1, status: 0),
      penging_sales: SalesReport.where(sale_type: 'Commics', status: 2),
      rejected_sales: SalesReport.where(sale_type: 'Action', status: 3).where('total > ?', 500),
      sales_by_category: SalesReport.all.group_by { |e| e.sale_type }
    }
  end
end