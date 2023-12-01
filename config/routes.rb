Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  # root to: 'products#index'
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users
  root to: "pages#home"
  resources :users

  resources :products, only: [:show, :new, :create]
  resources :deposits
  
  post 'increment' => "users#increment"

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
