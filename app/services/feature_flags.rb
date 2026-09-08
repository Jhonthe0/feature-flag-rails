class FeatureFlags
  DEFAULTS = {
    "new_checkout" => {
      "enabled" => false,
      "rollout_percentage" => 0
    }
  }.freeze

  class << self
    def all
      @flags ||= DEFAULTS.deep_dup
    end

    def find(flag_name)
      all.fetch(flag_name.to_s)
    end

    def enabled_for?(flag_name, actor_id)
      flag = find(flag_name)
      return false unless flag["enabled"]

      bucket_for(actor_id, flag_name) < flag["rollout_percentage"].to_i
    end

    def update(flag_name, enabled:, rollout_percentage:)
      flags = all
      flags[flag_name.to_s] = flag_payload(enabled, rollout_percentage)
      @flags = flags
    end

    def reset!
      @flags = DEFAULTS.deep_dup
    end

    private

    def flag_payload(enabled, rollout_percentage)
      {
        "enabled" => ActiveModel::Type::Boolean.new.cast(enabled),
        "rollout_percentage" => rollout_percentage.to_i.clamp(0, 100)
      }
    end

    def bucket_for(actor_id, flag_name)
      Digest::SHA256.hexdigest("#{flag_name}:#{actor_id}").to_i(16) % 100
    end
  end
end
