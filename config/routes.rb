require 'sidekiq/web'

Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :servers, only: [:index, :create, :update, :destroy]
      resources :systems, only: [:index, :show], concerns: :paginatable
    end
  end

  resources :servers, only: [:index] do
    collection do
      post :announce
    end
  end

  resources :docs, only: :index

  mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'
end
