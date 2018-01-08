Rails.application.routes.draw do
  resources :servers, only: [:index, :create, :update, :destroy]
end
