Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resource :cart, only: :show
  post "cart/items/:product_id", to: "carts#create", as: :cart_items
  delete "cart/items/:product_id", to: "carts#destroy", as: :cart_item
  patch "cart/coupon", to: "carts#update_coupon", as: :cart_coupon

  root "products#index"
end
