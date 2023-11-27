# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/home')

  get 'home', to: 'home#show', as: 'home'
  get 'home/cart', to: 'cart#cart' , as: 'cart'
  get 'home/trade', to: 'trade#trade' , as: 'trade'
  get 'home/order', to: 'order#order' , as: 'order'
  get 'home/custom-hat', to: 'custom#custom' , as: 'custom'


  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
