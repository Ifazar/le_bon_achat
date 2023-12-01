Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:show, :new, :create]
  resources :deposits
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # root to: 'products#index'

  resources :users
  resources :establishments do
    resources :products
  end
  resources :products do
    resources :establishment, only: [:index]
  end

  resources :establishments do
    member do
      patch 'confirme'
    end
  end
end
