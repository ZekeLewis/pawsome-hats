# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/home')

  get 'home', to: 'home#show', as: 'home'
  # get 'home/cart', to: 'cart#cart' , as: 'cart'

  get 'home/order', to: 'order#order' , as: 'order'
  get 'home/custom-hat', to: 'custom#custom' , as: 'custom'
  get 'home/poodlehat', to: 'poodlehat#index', as: 'poodleindex'
  get 'home/poodlehat/:id', to: 'poodlehat#show', as: 'poodlehat'
  get 'home/chihuahuahat', to: 'chihuahuahat#index', as: 'chihuahuaindex'
  get 'home/chihuahuahat/:id', to: 'chihuahuahat#show', as: 'chihuahuahat'
  get 'home/dobermanhat', to: 'dobermanhat#index', as: 'dobermanindex'
  get 'home/dobermanhat/:id', to: 'dobermanhat#show', as: 'dobermanhat'

  #add to cart
  get 'home/dobermanhat/:id/add_to_cart', to: 'dobermanhat#add_to_cart', as: 'dobermanhat_add_to_cart'
  get 'home/poodlehat/:id/add_to_cart', to: 'poodlehat#add_to_cart', as: 'poodle_add_to_cart'
  get 'home/chihuahuahat/:id/add_to_cart', to: 'chihuahuahat#add_to_cart', as: 'chihuahuahat_add_to_cart'

  get 'cart/review', to: 'carts#review', as: 'review_cart'
  delete 'cart/review/:id', to: 'carts#destroy', as: 'remove_cart_item'
  post 'home/dobermanhat/:id/cart/add_item/:id', to: 'carts#add_item', as: 'add_item_to_cart'
  post 'cart/apply_promo_code', to: 'cart#apply_promo_code', as: 'apply_promo_code'


  get 'trade', to: 'trade#trade', as: 'trade'
  get 'trade/new', to: 'trade#new', as: 'new_trade'
  post 'trade', to: 'trade#create'
  get 'trade/:id', to: 'trade#show', as: 'trade_show'
  delete 'trade/:id', to: 'trade#destroy'

  post 'trade/:id/add_to_cart', to: 'trade#add_to_cart', as: 'add_trade_item_to_cart'

  get 'home/feedback', to: 'feedbacks#new', as: 'new_home_feedback'
  post 'home/feedback', to: 'feedbacks#create', as: 'create_home_feedback'

  get 'checkout', to: 'checkout#new', as: 'new_checkout'
  post 'checkout/create', to: 'checkout#create', as: 'checkout_create'

  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
