require 'test_helper'

class My::ProductCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_product_categories_index_url
    assert_response :success
  end

end
