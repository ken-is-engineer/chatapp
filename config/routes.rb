Rails.application.routes.draw do
  devise_for :users
  resources:users, only: [:edit, :update, :destroy]
  get 'messages/index'
  root to: "messages#index"
end
