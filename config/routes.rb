# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :sign_out
    get '/auth/:provider/callback', to: 'devise/sessions#create'
  end
  # get '/auth/:provider/callback', to: 'sessions#create'

  get 'welcome/index'

  get '/change_free', to: 'billboards#change_free', as: 'change_free'
  get '/show_booked', to: 'billboards#show_booked', as: 'show_booked'
  # post '/show_booked', to: 'billboards#show_booked', as: 'show_booked'
  get '/change_seen', to: 'requests#change_seen', as: 'change_seen'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users
  # get  '/signup',  to: 'users#new'

  root 'billboards#index'

  resources :users, only: %i[index show]
  resources :billboards
  resources :billboards do
    post 'requests', to: 'requests#create'
    # post 'comments', to: 'comments#create'
    resources :comments, only: %i[create destroy]
  end
  resources :requests
  resources :requests do
    post 'rents', to: 'rents#create'
  end
  resources :rents
end
