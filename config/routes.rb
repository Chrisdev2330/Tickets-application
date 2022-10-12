Rails.application.routes.draw do
  resources :tickets do
    resources :comments
    member do
      post :edit_update
      put :update_technical
    end
  end
  resources :technicals, except: [:new, :create] do
    member do
      get :new_technical
      post :create_technical
    end
  end
  resources :customers, except: [:new, :create] do
    member do
      get :new_customer
      post :create_customer
    end
  end

  resources :buildings

  get 'Inicio', to: "homes#Index"
  resources :users do
    member do
      get :edit_profile
      post :update_profile
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '*unmatched_route', to: 'errors#show', code: 404
end
