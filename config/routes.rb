Rails.application.routes.draw do
  root "home#index"

  # OAuth flow endpoints
  get "/auth/login", to: "auth#login"
  get "/auth/register", to: "auth#register"
  get "/auth/callback", to: "auth#callback"
  post "/auth/refresh", to: "auth#refresh"
  post "/auth/logout", to: "auth#logout"

  scope :dashboard do
    get "/", to: "dashboard#index", as: :dashboard
  end


  namespace :api do
    get "/me", to: "users#me"
    resources :resources
  end

  resources :friends, only: [ :index ] do
    collection do
      get :discover
    end
    member do
      delete :unfriend
    end
  end

  resources :friend_requests, only: [ :index, :create ] do
    member do
      patch :accept
      patch :decline
    end
  end

  resources :chat_rooms, only: [ :index, :show ] do
    resources :messages, only: [ :create ]
  end

  post "chat_rooms/private/:friend_id", to: "chat_rooms#create_private_chat", as: "create_private_chat"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
