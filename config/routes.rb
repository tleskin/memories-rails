Rails.application.routes.draw do
  resources :moments, only: [:index, :create]
  resources :memories, only: [:index]
end
