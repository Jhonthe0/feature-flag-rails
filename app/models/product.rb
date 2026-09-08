class Product < ApplicationRecord
  validates :name, :description, :image_color, presence: true
  validates :price_cents, numericality: { greater_than: 0 }

  def price
    price_cents / 100.0
  end
end
