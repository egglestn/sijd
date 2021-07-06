Rails.application.routes.draw do
  root "welcome#index"
  get "/", to: "welcome#index"

  resources :records, only: [:new, :create, :show]
  resources :records_things, only: [:new, :create, :show]
end
