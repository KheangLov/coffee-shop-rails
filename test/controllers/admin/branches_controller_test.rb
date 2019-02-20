require 'test_helper'

class Admin::BranchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_branches_index_url
    assert_response :success
  end

end
