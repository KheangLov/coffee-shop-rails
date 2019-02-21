require 'test_helper'

class My::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_products_index_url
    assert_response :success
  end

end
