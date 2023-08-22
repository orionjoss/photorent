Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/update'
  get 'bookings/edit'
  get 'bookings/delete'
  get 'bookings/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cameras do
    resources :bookings
  end

  get "/dashboard" , to: "pages#dashboard"
end
