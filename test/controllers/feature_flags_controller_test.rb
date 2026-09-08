require "test_helper"

class FeatureFlagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    FeatureFlags.reset!
  end

  test "updates checkout feature flag" do
    patch feature_flag_path("new_checkout"), params: {
      feature_flag: {
        enabled: "1",
        rollout_percentage: "50"
      }
    }

    assert_redirected_to feature_flags_path
    assert_equal 50, FeatureFlags.find(:new_checkout)["rollout_percentage"]
    assert FeatureFlags.find(:new_checkout)["enabled"]
  end

  test "resets flags" do
    FeatureFlags.update(:new_checkout, enabled: true, rollout_percentage: 100)

    post reset_feature_flags_path

    assert_redirected_to feature_flags_path
    assert_equal FeatureFlags::DEFAULTS, FeatureFlags.all
  end
end
