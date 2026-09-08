require "test_helper"

class FeatureFlagsTest < ActiveSupport::TestCase
  test "keeps coupons disabled by default" do
    with_coupons_flag(nil) do
      assert_not FeatureFlags.coupons_enabled?
    end
  end

  test "enables coupons from environment variable" do
    with_coupons_flag("true") do
      assert FeatureFlags.coupons_enabled?
    end
  end

  private

  def with_coupons_flag(value)
    previous_value = ENV["COUPONS_ENABLED"]
    value.nil? ? ENV.delete("COUPONS_ENABLED") : ENV["COUPONS_ENABLED"] = value
    yield
  ensure
    previous_value.nil? ? ENV.delete("COUPONS_ENABLED") : ENV["COUPONS_ENABLED"] = previous_value
  end
end
