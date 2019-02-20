require 'test_helper'

class Admin::StockCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_stock_categories_index_url
    assert_response :success
  end

end
