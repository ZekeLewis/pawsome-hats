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

get 'home/feedback', to: 'feedbacks#new', as: 'new_home_feedback'
post 'home/feedback', to: 'feedbacks#create', as: 'create_home_feedback'

get 'cart/review', to: 'cart#review', as: 'review_cart'
post 'cart/apply_promo_code', to: 'cart#apply_promo_code', as: 'apply_promo_code'



  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users


end
