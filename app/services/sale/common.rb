class Sale::Common
  def initialize(params, scope)
    @params = params
    @scope = scope
  end

  def operations_common_where
    start_date = get_start_date(@params)
    end_date = get_end_date(@params)
    @scope.where(created_at: start_date..end_date)
          .by_sale_type(@params[:sale_type])
          .by_country(@params[:country])
  end

  private

  def get_start_date(params)
    params[:start_date].nil? ? Time.current.beginning_of_day - 2.months : Time.zone.parse(params[:start_date]).beginning_of_day
  end

  def get_end_date(params)
    params[:end_date].nil? ? Time.current.end_of_day : Time.zone.parse(params[:end_date]).end_of_day
  end
end