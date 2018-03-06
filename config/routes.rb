Rails.application.routes.draw do
  resources :books, only: %i[index show] do
    resources :histories, only: %i[create update]
    resources :likes, only: %i[create update]
    resources :comments, only: :create
  end
  devise_for :users
  root 'books#index'
end
