# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users

  resources :maps do
    scope module: :maps do
      resources :pins
    end
  end
end
