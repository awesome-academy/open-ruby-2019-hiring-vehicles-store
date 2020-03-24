Rails.application.routes.draw do
  
  require "sidekiq/web"

  mount Sidekiq::Web => "/sidekiq"

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/signup", to: "users#new"
    get "vehicle(/:search)", to: "vehicles#index", as: :vehicles
    get "/card/new", to: "billing#new", as: :add_payment_method
    post "/card", to: "billing#create", as: :create_payment_method
    get "/success", to: "billing#success", as: :success
    get "/sign_up_stripe", to: "billing#index", as: :stripe_sign_up
    post "payment", to: "billing#payment"
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

    namespace :import_file do
      resources :imports, only: :create
    end
  end
end
