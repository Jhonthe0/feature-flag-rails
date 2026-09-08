class FeatureFlagsController < ApplicationController
  def index
    @flags = FeatureFlags.all
  end

  def update
    FeatureFlags.update(
      params[:id],
      enabled: flag_params[:enabled],
      rollout_percentage: flag_params[:rollout_percentage]
    )

    redirect_to feature_flags_path, notice: "Flag atualizada."
  end

  def reset
    FeatureFlags.reset!
    redirect_to feature_flags_path, notice: "Flags restauradas."
  end

  private

  def flag_params
    params.require(:feature_flag).permit(:enabled, :rollout_percentage)
  end
end
