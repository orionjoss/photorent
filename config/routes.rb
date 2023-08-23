Rails.application.routes.draw do
  devise_for :users
  root to: "cameras#index"

  resources :cameras do
    resources :bookings
  end

  get "/dashboard", to: "pages#dashboard"
end
