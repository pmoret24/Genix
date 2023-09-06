Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pitches, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :show]
    resources :favorites, only: [:create]

  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :projects do
    resources :members, only: %i[new create]
  end

  resources :members, only: %i[update]
  # Defines the root path route ("/")

end
