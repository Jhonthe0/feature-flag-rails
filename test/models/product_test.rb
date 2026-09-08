require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "requires a positive price" do
    product = Product.new(
      name: "Produto teste",
      description: "Descricao",
      price_cents: 0,
      image_color: "#ffffff"
    )

    assert_not product.valid?
  end
end
