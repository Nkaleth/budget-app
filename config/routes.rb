Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :payments, only: [:index, :show, :create, :new, :destroy]
    resources :categories do
      resources :payments, only: [:index, :show, :create, :new, :destroy]
    end
  end
  # Defines the root path route ("/")
  root "pages#home"
end
