Rails.application.routes.draw do
  resources :servers, only: [:index, :create, :update, :destroy]
  resources :docs, only: :index

  root 'welcome#index'
end
