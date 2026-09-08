class DiscountCoupon
  COUPONS = {
    "AULA10" => 10,
    "FLAGS20" => 20
  }.freeze

  class << self
    def valid?(coupon_code)
      COUPONS.key?(normalize(coupon_code))
    end

    def discount_percentage(coupon_code)
      COUPONS.fetch(normalize(coupon_code), 0)
    end

    private

    def normalize(coupon_code)
      coupon_code.to_s.strip.upcase
    end
  end
end
