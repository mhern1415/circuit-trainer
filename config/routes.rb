Rails.application.routes.draw do
  root 'circuits#index'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'

get '/signup' => 'users#new'
post '/signup' => 'users#create'


  resources :exercises
  resources :circuits
  resources :workouts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
