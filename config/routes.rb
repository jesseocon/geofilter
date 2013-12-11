Cavinterview::Application.routes.draw do
  
  get 'signup',     to: 'user_accounts#new',  as: 'signup'
  get 'login',      to: 'sessions#new',       as: 'login'
  delete 'logout',  to: 'sessions#destroy',   as: 'logout'
  
  root to: 'restaurants#index'
  
  resources :addresses
  resources :restaurants
  resources :restaurant_accounts
  resources :sessions
  resources :user_accounts

end
