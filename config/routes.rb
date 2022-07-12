Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",

  }

  root to: "animals#index"
  resources :users, only: [:show, :edit, :update]
  resources :zoos, only: [:create, :new, :show, :edit, :update, :index]
  resources :animals, only: [:create, :new, :show, :edit, :update, :index]



end
