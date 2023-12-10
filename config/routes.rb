# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/home')
  resources :feedbacks, only: [:new, :create, :show]

  get 'home', to: 'home#show', as: 'home'
  # get 'home/cart', to: 'cart#cart' , as: 'cart'

  #get 'home/order', to: 'order#order' , as: 'orderhistory'
  get 'home/custom-hat', to: 'custom#new' , as: 'custom'
  post 'home/custom-hat', to: 'custom#create'

  get 'home/poodlehat', to: 'poodlehat#index', as: 'poodleindex'
  get 'home/poodlehat/new', to: 'poodlehat#new', as: 'new_poodlehat'
  post 'home/poodlehat/new', to: 'poodlehat#create'
  get 'home/poodlehat/:id/edit', to: 'poodlehat#edit', as: 'edit_poodlehat'
  patch 'home/poodlehat/:id', to: 'poodlehat#update'
  put 'home/poodlehat/:id', to: 'poodlehat#update'
  delete 'home/poodlehat/:id', to: 'poodlehat#destroy'
  get 'home/poodlehat/:id', to: 'poodlehat#show', as: 'poodlehat'

  get 'home/chihuahuahat', to: 'chihuahuahat#index', as: 'chihuahuaindex'
  get 'home/chihuahuahat/new', to: 'chihuahuahat#new', as: 'new_chihuahuahat'
  post 'home/chihuahuahat/new', to: 'chihuahuahat#create'
  get 'home/chihuahuahat/:id/edit', to: 'chihuahuahat#edit', as: 'edit_chihuahuahat'
  patch 'home/chihuahuahat/:id', to: 'chihuahuahat#update'
  put 'home/chihuahuahat/:id', to: 'chihuahuahat#update'
  delete 'home/chihuahuahat/:id', to: 'chihuahuahat#destroy'
  get 'home/chihuahuahat/:id', to: 'chihuahuahat#show', as: 'chihuahuahat'


  get 'home/dobermanhat', to: 'dobermanhat#index', as: 'dobermanindex'
  get 'home/dobermanhat/new', to: 'dobermanhat#new', as: 'new_dobermanhat'
  post 'home/dobermanhat/new', to: 'dobermanhat#create'
  get 'home/dobermanhat/:id/edit', to: 'dobermanhat#edit', as: 'edit_dobermanhat'
  patch 'home/dobermanhat/:id', to: 'dobermanhat#update'
  put 'home/dobermanhat/:id', to: 'dobermanhat#update'
  delete 'home/dobermanhat/:id', to: 'dobermanhat#destroy'
  get 'home/dobermanhat/:id', to: 'dobermanhat#show', as: 'dobermanhat'
  #add to cart
  get 'home/dobermanhat/:id/add_to_cart', to: 'dobermanhat#add_to_cart', as: 'dobermanhat_add_to_cart'
  get 'home/poodlehat/:id/add_to_cart', to: 'poodlehat#add_to_cart', as: 'poodle_add_to_cart'
  get 'home/chihuahuahat/:id/add_to_cart', to: 'chihuahuahat#add_to_cart', as: 'chihuahuahat_add_to_cart'

  get 'cart/review', to: 'carts#review', as: 'review_cart'
  delete 'cart/review/:id', to: 'carts#destroy', as: 'remove_cart_item'
  post 'home/dobermanhat/:id/cart/add_item/:id', to: 'carts#add_item', as: 'add_item_to_cart'
  post 'cart/apply_promo_code', to: 'cart#apply_promo_code', as: 'apply_promo_code'

  #update cart
  patch 'cart/review/:id/update_quantity', to: 'cart_items#update_quantity', as: :update_cart_item_quantity



  get 'trade', to: 'trade#trade', as: 'trade'
  get 'trade/new', to: 'trade#new', as: 'new_trade'
  post 'trade', to: 'trade#create'
  get 'trade/:id', to: 'trade#show', as: 'trade_show'
  delete 'trade/:id', to: 'trade#destroy'

  post 'trade/:id/add_to_cart', to: 'trade#add_to_cart', as: 'add_trade_item_to_cart'

  get 'home/feedback/show', to: 'feedbacks#show', as: 'show_feedback'
  get 'home/feedback', to: 'feedbacks#new', as: 'new_home_feedback'
  post 'home/feedback', to: 'feedbacks#create', as: 'create_home_feedback'
  # resources :carts do
  #   post 'apply_promo_code', on: :member
  # end

  post 'cart/review/:id/apply_promo_code', to: 'carts#apply_promo_code'


  post 'cart/apply_promo_code', to: 'cart#apply_promo_code', as: 'cart_apply_promo_code'
  
  get 'checkout', to: 'checkout#new', as: 'new_checkout'
  post 'checkout/create', to: 'checkout#create', as: 'checkout_create'

  get 'order', to: 'order#orderhistory' , as: 'order_history'
  get 'order/:id', to: 'order#show', as: 'order_show'

  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
