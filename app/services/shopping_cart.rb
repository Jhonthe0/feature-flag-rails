class ShoppingCart
  attr_reader :session

  def initialize(session)
    @session = session
  end

  def add(product_id)
    product_ids << product_id.to_s
    session[:cart_product_ids] = product_ids
  end

  def remove(product_id)
    product_ids.delete_at(product_ids.index(product_id.to_s) || product_ids.length)
    session[:cart_product_ids] = product_ids
  end

  def products
    Product.where(id: product_ids).index_by(&:id).values_at(*product_ids.map(&:to_i)).compact
  end

  def item_count
    product_ids.size
  end

  def apply_coupon(coupon_code)
    session[:coupon_code] = FeatureFlags.coupons_enabled? ? coupon_code.to_s.strip : nil
  end

  def coupon_code
    session[:coupon_code].to_s
  end

  private

  def product_ids
    session[:cart_product_ids] ||= []
  end
end
