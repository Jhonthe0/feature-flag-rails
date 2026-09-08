class FeatureFlags
  class << self
    def coupons_enabled?
      ActiveModel::Type::Boolean.new.cast(ENV.fetch("COUPONS_ENABLED", "false"))
    end
  end
end
