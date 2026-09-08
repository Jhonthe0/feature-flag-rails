require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "shows product catalog" do
    get root_path

    assert_response :success
    assert_select "h1", "Produtos para testar feature flags"
    assert_select "h2", products(:notebook).name
  end
end
