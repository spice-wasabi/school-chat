Rails.application.routes.draw do
  root to: 'tops#index'
  resources :schools, only: [:new, :create]
end
