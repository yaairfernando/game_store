class DashboardController < ApplicationController
  def sales_report
    @sales_report = SaleDashboardService.call
    render json: 2
  end
end
