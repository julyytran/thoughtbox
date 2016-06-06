Rails.application.routes.draw do
  root 'users#show'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  get "signup"  => "users#new"
end
