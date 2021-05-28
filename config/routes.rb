# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recommended' => 'movies#recommended'
  get 'image' => 'movies#image'
  post 'upvote' => 'movies#upvote'
  resources :users
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
