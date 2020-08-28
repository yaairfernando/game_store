require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get sales_report" do
    get dashboard_sales_report_url
    assert_response :success
  end

end
