class CartSummary
  attr_reader :products, :coupon_code

  def initialize(products, coupon_code)
    @products = products
    @coupon_code = coupon_code
  end

  def subtotal_cents
    products.sum(&:price_cents)
  end

  def discount_cents
    return 0 unless FeatureFlags.coupons_enabled?

    subtotal_cents * DiscountCoupon.discount_percentage(coupon_code) / 100
  end

  def total_cents
    subtotal_cents - discount_cents
  end
end
