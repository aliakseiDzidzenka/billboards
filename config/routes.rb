Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  devise_scope :user do
  	delete 'sign_out', :to => 'devise/sessions#destroy', :as => :sign_out
	end
  
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :users
  #get  '/signup',  to: 'users#new'

  root 'welcome#index'
end
