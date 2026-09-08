Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resource :checkout, only: :show
  resources :feature_flags, only: %i[index update]
  post "feature_flags/reset", to: "feature_flags#reset", as: :reset_feature_flags

  root "checkouts#show"
end
