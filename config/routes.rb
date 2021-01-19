Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :schools, only: [:new, :create]
  resources :students, only: [:new, :create]
  resources :rooms, only: [:index, :new, :create]
end
