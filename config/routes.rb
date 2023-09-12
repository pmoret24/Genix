Rails.application.routes.draw do
  devise_for :users
  resources :connections, only: %i[destroy create update]

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pitches, only: %i[index new show create edit update destroy] do
    resources :comments, only: %i[create show]
    resources :favorites, only: [:create]

  end
  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
  resources :projects do
    resources :members, only: %i[new create]
  end

  resources :profiles, only: [] do
    resources :chatrooms, only: [:create]
  end

  resources :members, only: %i[update destroy]
  # Defines the root path route ("/")

  get "users/:id", to: "profiles#show", as: "profile"

  get "users", to: "profiles#index", as: "profiles"

  get "aboutus", to: "pages#about", as: "aboutus"
end
