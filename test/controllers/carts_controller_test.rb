require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:student)
  end

  test "adds products to cart" do
    post cart_items_path(product_id: products(:notebook).id)

    assert_redirected_to root_path
    assert_equal [products(:notebook).id.to_s], session[:cart_product_ids]
  end

  test "hides coupon form when flag is disabled" do
    with_coupons_flag("false") do
      get cart_path

      assert_response :success
      assert_select ".flag-off strong", "Cupons desligados"
    end
  end

  test "shows coupon form when flag is enabled" do
    with_coupons_flag("true") do
      get cart_path

      assert_response :success
      assert_select "label", "Cupom"
    end
  end

  private

  def with_coupons_flag(value)
    previous_value = ENV["COUPONS_ENABLED"]
    ENV["COUPONS_ENABLED"] = value
    yield
  ensure
    previous_value.nil? ? ENV.delete("COUPONS_ENABLED") : ENV["COUPONS_ENABLED"] = previous_value
  end
end
