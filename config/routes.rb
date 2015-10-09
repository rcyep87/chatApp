Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :users

  get    'login'  , to: 'sessions#new'    , as: 'login'
  post   'login'  , to: 'sessions#create' , as: 'create_session'
  delete 'logout' , to: 'sessions#destroy', as: 'logout'

  get    'about', to: 'homepage#show'

  root   'users#new'
end
