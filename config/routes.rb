Rails.application.routes.draw do
  get 'cart/add'
  get 'cart/index'
  get 'cart/remove'

  devise_for :users
  resources :products

  root 'products#index'
end
