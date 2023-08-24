Rails.application.routes.draw do
  devise_for :users
  root to: "cameras#index"

  resources :cameras do
    resources :bookings do
      member do
        patch :accept
        patch :decline
      end
    end
  end

  # resources :dashboard do
  #   resources :cameras
  # end

  get "/dashboard", to: "pages#dashboard"
  # get "/cameras/dashboard", to: "pages#dashboard"
end
