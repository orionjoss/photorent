Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cameras do
    resources :bookings do
      member do
        patch :accept
        patch :decline
      end
    end
  end

  get "/dashboard", to: "pages#dashboard"
  # get "/dashboard", to: "bookings#accept"
end
