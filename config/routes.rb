Rails.application.routes.draw do
  resources :books, only: %i[index show] do
    resources :histories, only: %i[create update]
  end
  devise_for :users
  root 'books#index'
end
