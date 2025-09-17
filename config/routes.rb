Rails.application.routes.draw do
  get "home/index"
  root "home#index"

  # OAuth flow endpoints
  get "/auth/login", to: "auth#login"
  get "/auth/callback", to: "auth#callback"
  post "/auth/refresh", to: "auth#refresh"
  post "/auth/logout", to: "auth#logout"

  # API endpoints
  namespace :api do
    get "/me", to: "users#me"
    resources :resources
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
