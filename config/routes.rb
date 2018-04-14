# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  get :privacy, to: 'home#privacy'
  get :terms, to: 'home#terms'

  resources :maps, only: %i[show]

  resource :me, only: %i[show edit update], controller: :me do
    resources :maps, module: :me do
      resources :pins, except: %i[index show], module: :maps
    end
  end
end
