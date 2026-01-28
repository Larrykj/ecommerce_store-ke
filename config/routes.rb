Rails.application.routes.draw do
  root "products#index"

  resources :products

  resource :cart, only: [ :show ]
  resources :cart_items, only: [ :create, :update, :destroy ]
  resources :orders, only: [ :new, :create, :show ]
end
