Rails.application.routes.draw do
  root 'links#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  get "authentication"  => "static_pages#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :links, only: [:index, :create, :destroy, :update]
    end
  end
end
