require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get stock_search" do
    get stocks_stock_search_url
    assert_response :success
  end

end
