# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/home')
  resources :feedbacks, only: [:new, :create]
  get 'home', to: 'home#show', as: 'home'
  get 'home/cart', to: 'cart#cart' , as: 'cart'
  get 'home/trade', to: 'trade#trade' , as: 'trade'
  get 'home/order', to: 'order#order' , as: 'order'
  get 'home/custom-hat', to: 'custom#custom' , as: 'custom'
  get 'home/poodlehat', to: 'poodlehat#index', as: 'poodleindex'
  get 'home/poodlehat/:id', to: 'poodlehat#show', as: 'poodlehat'
  get 'home/chihuahuahat', to: 'chihuahuahat#index', as: 'chihuahuaindex'
  get 'home/chihuahuahat/:id', to: 'chihuahuahat#show', as: 'chihuahuahat'
  get 'home/dobermanhat', to: 'dobermanhat#index', as: 'dobermanindex'

  get 'home/dobermanhat/:id', to: 'dobermanhat#show', as: 'dobermanhat'

get 'home/feedback', to: 'feedbacks#new', as: 'new_home_feedback'
post 'home/feedback', to: 'feedbacks#create', as: 'create_home_feedback'

get 'cart/review', to: 'cart#review', as: 'review_cart'
post 'cart/apply_promo_code', to: 'cart#apply_promo_code', as: 'apply_promo_code'



  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
