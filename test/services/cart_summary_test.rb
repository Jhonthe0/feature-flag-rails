require "test_helper"

class CartSummaryTest < ActiveSupport::TestCase
  test "ignores valid coupon when feature flag is disabled" do
    with_coupons_flag("false") do
      summary = CartSummary.new([products(:notebook)], "AULA10")

      assert_equal 0, summary.discount_cents
    end
  end

  test "applies valid coupon when feature flag is enabled" do
    with_coupons_flag("true") do
      summary = CartSummary.new([products(:notebook)], "AULA10")

      assert_equal 249, summary.discount_cents
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
