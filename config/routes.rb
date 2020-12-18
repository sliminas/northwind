# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :products, only: :index
  end

  resources :products, only: %i[index show]

  root to: "products#index"
end
