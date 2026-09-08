class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    build_cart_view
  end

  def create
    cart.add(product_id)
    redirect_to root_path, notice: "Produto adicionado ao carrinho."
  end

  def destroy
    cart.remove(product_id)
    redirect_to cart_path, notice: "Produto removido."
  end

  def update_coupon
    cart.apply_coupon(coupon_code)
    redirect_to cart_path, notice: coupon_notice
  end

  private

  def build_cart_view
    @cart_products = cart.products
    @coupon_code = cart.coupon_code
    @coupon_enabled = FeatureFlags.coupons_enabled?
    @cart_summary = CartSummary.new(@cart_products, @coupon_code)
  end

  def cart
    @cart ||= ShoppingCart.new(session)
  end

  def product_id
    params.require(:product_id)
  end

  def coupon_code
    params.fetch(:coupon_code, "")
  end

  def coupon_notice
    return "Cupons desativados pela feature flag." unless FeatureFlags.coupons_enabled?
    return "Cupom aplicado." if DiscountCoupon.valid?(coupon_code)

    "Cupom invalido."
  end
end
