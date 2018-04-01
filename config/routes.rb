# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resource :me do
    scope module: :me do
      resources :maps do
        scope module: :maps do
          resources :pins, except: %i[index show]
        end
      end
    end
  end

  resources :maps, only: %i[show]
end
