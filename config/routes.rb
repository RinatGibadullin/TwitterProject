Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  root 'posts#index', as: 'home'
  resources :posts do
  	resources :comments
  end
end
