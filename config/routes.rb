Rails.application.routes.draw do
  resources :servers, only: [:index, :create, :update, :destroy] do
    collection do
      post :announce
    end
  end

  resources :docs, only: :index

  root 'welcome#index'
end
