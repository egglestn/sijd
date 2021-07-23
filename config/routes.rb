Rails.application.routes.draw do
  root "welcome#index"
  get "/", to: "welcome#index"

  resources :records, only: [:new, :create, :show, :update]
  resources :records_activities, only: [:new, :create, :show]
end
