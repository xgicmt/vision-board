Rails.application.routes.draw do

  get 'welcome/about' 
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :boards do
    resources :images, only: [:create, :destroy]
  end
 
  resources :images
  resources :admins, only: [:index]
  resources :share, only: [:show]
  
  authenticated :user do
   root to: 'boards#index', as: :authenticated_root
  end

  root to: 'welcome#index'
  
end
