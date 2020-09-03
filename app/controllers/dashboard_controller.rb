class DashboardController < ApplicationController
  def sales_report
    @sales_report = SaleDashboardService.new(sale_params).call
    render json: @sales_report
  end

  private

  def sale_params
    params.permit(:sale_type, :country, :start_date, :end_date)
  end
end
