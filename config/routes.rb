Rails.application.routes.draw do
  root "welcome#index"
  get "/", to: "welcome#index"

  resources :records, only: [:new, :create, :show, :update, :index]
  resources :records_activities, only: [:new, :create, :show]
  resources :records_medicines, only: [:new, :create, :show]
  resources :records_vitamins, only: [:new, :create, :show]
  resources :records_treatments, only: [:new]
  resources :activities, only: [:index]
  resources :medicines, only: [:index]
  resources :treatments, only: [:index]
  resources :vitamins, only: [:index]
end
