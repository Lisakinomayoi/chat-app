Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  #root to: "messages#index"
  resources :users, only: [:edit, :update] #モデルごとに分けていることに注意！
  resources :rooms, only: [:new, :create, :destroy] do #roomsが親、messagesが子＝チャットルームの属している
    resources :messages, only: [:index, :create]
  end
end