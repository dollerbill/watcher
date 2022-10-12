# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recommended' => 'movies#recommended'
  get 'welcome' => 'users#welcome'
  post 'reaction' => 'user_reactions#rate'
  post 'users' => 'users#create'
  root 'movies#rate'
  resources :invites, :movies
end
