Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pitches, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :show]
    
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  # Defines the root path route ("/")


end
