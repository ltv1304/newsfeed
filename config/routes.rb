Rails.application.routes.draw do
  root 'reports#index'
  
  devise_for :users
  resources :users, only: [:show, :edit, :destroy]
  resources :reports, only: [:index, :show]


  namespace :editor do
    resources :reports, except: [:index, :destroy, :show]
  end

  namespace :admin do
    resources :reports, only: :destroy
    resources :users, only: :index
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
