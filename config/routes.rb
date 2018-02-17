Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :servers, only: [:index, :create, :update, :destroy]
    end
  end

  resources :servers, only: [:index] do
    collection do
      post :announce
    end
  end

  resources :docs, only: :index

  root 'welcome#index'
end
