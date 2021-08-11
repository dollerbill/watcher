# frozen_string_literal: true

Rails.application.routes.draw do
  get 'rated' => 'movies#rated'
  get 'recommended' => 'movies#recommended'
  get 'streaming_service' => 'movies#streaming_service'
  # get 'invite' => 'users#invite'
  post 'reaction' => 'user_reactions#rate'
  post 'users' => 'users#create'
  root 'movies#rate'
  resources :invites, :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
