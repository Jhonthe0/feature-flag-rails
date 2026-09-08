class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).limit(20)
    @cart_item_count = ShoppingCart.new(session).item_count
  end
end
