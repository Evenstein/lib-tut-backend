# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admins
  devise_for :users, controllers: { confirmations: 'confirmations' }

  root to: 'books#index'

  ###
  # API NAMESPACE
  ###
  namespace :api, defaults: { format: :json } do
    resources :books, only: :index do
      get 'page/:page', action: :index, on: :collection
    end
    resources :tags, only: :index
    get 'book_search', to: 'books#search'
    post 'tag_search', to: 'tags#search'
    resources :registrations, only: :create
    resource :auth_tokens, only: :create
  end

  resources :books
  resources :tags, only: %i[new create]
  get 'tags/:tag', to: 'books#index', as: :tag
end
