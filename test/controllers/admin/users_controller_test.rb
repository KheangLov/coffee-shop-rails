require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_users_dashboard_url
    assert_response :success
  end

end
