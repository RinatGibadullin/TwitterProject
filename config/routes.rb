Rails.application.routes.draw do
  devise_for :users
  root 'posts#index', as: 'home'
  resources :posts
end
