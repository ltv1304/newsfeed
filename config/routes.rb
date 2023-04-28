Rails.application.routes.draw do
  devise_for :users
  resources :users #, :only => [:show, :index, :edit, :update, :destroy]
  root 'reports#index'
  resources :reports
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
