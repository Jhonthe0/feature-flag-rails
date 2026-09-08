require "test_helper"

class CheckoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    FeatureFlags.reset!
  end

  test "shows current checkout when flag is disabled" do
    get checkout_path

    assert_response :success
    assert_select "h2", "Checkout atual"
  end

  test "shows new checkout when flag is enabled for everyone" do
    FeatureFlags.update(:new_checkout, enabled: true, rollout_percentage: 100)

    get checkout_path

    assert_response :success
    assert_select "h2", "Novo checkout"
  end
end
