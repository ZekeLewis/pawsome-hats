# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/home')

  get 'home', to: 'home#show', as: 'home'
  get 'home/poodlehat', to: 'poodlehat#index', as: 'poodleindex'
  get 'home/poodlehat/:id', to: 'poodlehat#show', as: 'poodlehat'
  get 'home/chihuahuahat', to: 'chihuahuahat#index', as: 'chihuahuaindex'
  get 'home/chihuahuahat/:id', to: 'chihuahuahat#show', as: 'chihuahuahat'
  get 'home/dobermanhat', to: 'dobermanhat#index', as: 'dobermanindex'

  get 'home/dobermanhat/:id', to: 'dobermanhat#show', as: 'dobermanhat'
 



  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
