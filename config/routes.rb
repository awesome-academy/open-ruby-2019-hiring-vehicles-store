Rails.application.routes.draw do
  
  require "sidekiq/web"

  mount Sidekiq::Web => "/sidekiq"

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/signup", to: "users#new"
    get "vehicle(/:search)", to: "vehicles#index", as: :vehicle
    resources :users, except: %i(index destroy)
    resources :admin, only: :index
    resources :hirings, only: %i(new create index)
    resources :branchs, only: %i(index show)
    resources :statistic, only: :index

    resources :vehicles, only: :show do
      resources :comments
    end

    resources :comments do
      resources :comments
    end

    namespace :admin do
      resources :vehicles, except: :show
      resources :branchs, except: :show
      resources :hirings
      resources :users, only: %i(edit show create)
    end
  end
end
