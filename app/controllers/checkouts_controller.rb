class CheckoutsController < ApplicationController
  def show
    @customer_id = checkout_customer_id
    @new_checkout_enabled = FeatureFlags.enabled_for?(:new_checkout, @customer_id)
    @flag = FeatureFlags.find(:new_checkout)
  end

  private

  def checkout_customer_id
    params.fetch(:customer_id, "42")
  end
end
