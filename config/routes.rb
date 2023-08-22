Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :cameras do
    resources :bookings
  end

  get "/dashboard" , to: "pages#dashboard"
end
