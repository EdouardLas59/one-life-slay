Rails.application.routes.draw do
  devise_for :users
  root to: "movies#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :dashboard

  resources :movies, except: :index do
    resources :bookings, only: [:new, :create, :update, :comfirm]
  end
  resources :bookings, only: [:destroy]

  resources :movies do
    get :autocomplete_title, on: :collection
    get :find_by_title, on: :collection  # Route pour récupérer les données complètes d'un film
  end


  # Defines the root path route ("/")
  # root "posts#index"
end
