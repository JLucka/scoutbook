Rails.application.routes.draw do
  resources :orders do
    member do
      get :close
    end
  end
  resources :patrols
  resources :troops
  resources :leaders
  resources :patrol_leaders
  resources :badges do
    member do
      get :close
    end
  end
  resources :scouts
  devise_for :users
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
end
