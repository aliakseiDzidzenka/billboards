Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  get  '/signup',  to: 'users#new'

  root 'welcome#index'
end
