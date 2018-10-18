Rails.application.routes.draw do
  resources :companies
  resources :kinds
  resources :users

  # get 'home/index'
  # get 'home/chuchu', to: 'home#index'
  root 'home#index'

  resources :addresses
  resources :phones
  resources :contacts
  resources :kinds, except: [:destroy]
  # resources(:kinds, {:except => [:destroy, :update, :edit]})

  resources :pets, only: [:index, :show, :new, :edit]
  # resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
