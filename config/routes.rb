Rails.application.routes.draw do
  devise_for :users
  resources:users, only: [:edit, :update, :destroy]
  resources:rooms, only: [:new, :create]
  get 'messages/index'
  root to: "rooms#index"
end
