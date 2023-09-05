Rails.application.routes.draw do
  devise_for :users
  resources :connections, only: [:destroy, :create]

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pitches, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :show]

  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  # Defines the root path route ("/")

  get "users/:id", to: "profiles#show", as: "profile"
  get "users", to: "profiles#index", as: "profiles"


end
