Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products
resources :categories

  resource :cart, only: [ :show ]
  resources :cart_items, only: [ :create, :update, :destroy ]

  resources :orders, only: [ :index, :show, :new, :create ]
  get "/server_time", to: "server_time#show"
end
