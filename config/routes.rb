Rails.application.routes.draw do
root 'sessions#index'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/auth/:provider/callback' => 'sessions#omniauth'
get '/users/:id', to: 'users#show'



  resources :exercises do
    resources :circuits, only: [:index, :new, :create]
  end
  resources :circuits
  resources :workouts do
    resources :circuits
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
