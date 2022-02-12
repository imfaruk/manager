# frozen_string_literal: true

Rails.application.routes.draw do
  resources :payment_requests, only: %i[index show update]
  root to: 'payment_requests#index'
end
