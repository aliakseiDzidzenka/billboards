Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  
  devise_scope :user do
  	delete 'sign_out', :to => 'devise/sessions#destroy', :as => :sign_out
  	get '/auth/:provider/callback', :to => 'devise/sessions#create' 
	end
	#get '/auth/:provider/callback', to: 'sessions#create'
  
  get 'welcome/index'
  get '/button', to: 'billboards#button', as: 'button'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :users
  #get  '/signup',  to: 'users#new'

  root 'billboards#index'

  resources :users
  resources :billboards     
  resources :billboards do
    post 'requests', to: 'requests#create'
  end
  resources :requests
  resources :requests do
    post 'rents', to: 'rents#create'
  end
  resources :rents



  
end
