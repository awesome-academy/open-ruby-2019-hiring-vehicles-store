Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/signup", to: "users#new"
    resources :users, only: :create
    resources :vehicles, only: :show
    resources :admin, only: :index
    resources :hirings, only: %i(new create index)
  end
  namespace :admin do
    resources :vehicles, except: :show
  end
end
