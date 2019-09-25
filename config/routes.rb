Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  resources :restaurents
  root 'restaurents#index'
end
