Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  resources :post_images, only: [:new, :create, :show, :edit, :index, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :update]
  get "/users/:id/index" => "users#withdraw", as: "withdraw"
  resources :categories, only: [:index, :show, :create, :edit, :update]
  get 'items/search'


end
