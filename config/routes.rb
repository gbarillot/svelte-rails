Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  localized do
    devise_for :users, only: [:sessions]

    namespace :api, :defaults => { :format => 'json' } do
      resources :movies, only: [:index, :show]

      namespace :admin do
        resources :dashboard, only: :index
        resources :movies, except: :show
      end
    end

    get '/admin', to: 'admin#index', as: 'admin_root'
    match "/admin/*path", to: "admin#index", format: false, via: :get

    root :to => "application#index"
    match "*path", to: "application#index", format: false, via: :get
  end
end