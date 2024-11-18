require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get client" do
    get dashboards_client_url
    assert_response :success
  end

  test "should get photographer" do
    get dashboards_photographer_url
    assert_response :success
  end
end
