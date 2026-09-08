require "test_helper"

class FeatureFlagsTest < ActiveSupport::TestCase
  setup do
    FeatureFlags.reset!
  end

  test "keeps checkout disabled by default" do
    assert_not FeatureFlags.enabled_for?(:new_checkout, "42")
  end

  test "enables checkout for everyone when rollout is 100 percent" do
    FeatureFlags.update(:new_checkout, enabled: true, rollout_percentage: 100)

    assert FeatureFlags.enabled_for?(:new_checkout, "42")
  end

  test "keeps checkout disabled when kill switch is off" do
    FeatureFlags.update(:new_checkout, enabled: false, rollout_percentage: 100)

    assert_not FeatureFlags.enabled_for?(:new_checkout, "42")
  end

  test "clamps rollout percentage" do
    FeatureFlags.update(:new_checkout, enabled: true, rollout_percentage: 150)

    assert_equal 100, FeatureFlags.find(:new_checkout)["rollout_percentage"]
  end
end
