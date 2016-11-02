Rails.application.routes.draw do
  root 'formulas#index'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create]
  resources :formulas

end
