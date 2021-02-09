Rails.application.routes.draw do
  devise_for :users
  resources:users, only: [:edit, :update, :destroy]
  resources:rooms, only: [:new, :create, :destroy] do
    resources:messages, only: [:index, :create]
  end #どのルームのメッセージなのかという考え方。
  root to: "rooms#index"
end
