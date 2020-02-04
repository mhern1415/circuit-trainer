Rails.application.routes.draw do
root 'sessions#index'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/auth/:provider/callback' => 'sessions#omniauth'
get '/users/:id', to: 'users#show'

get 'about', to: 'static#about'
get 'resources', to: 'static#resources'

  resources :exercises do
    resources :circuits, only: [:index, :new, :create]
  end
  resources :circuits
  resources :workouts do
    resources :circuits
  end
  resources :users
end
