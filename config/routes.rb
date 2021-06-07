# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#rate'
  get 'recommended' => 'movies#recommended'
  get 'streaming_service' => 'movies#streaming_service'

  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
