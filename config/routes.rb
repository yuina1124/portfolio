Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  resources :users, only: [:show, :edit, :update]
  resources :zoos, only: [:create, :new, :show, :edit, :update]
  resources :animals, only: [:create, :new, :show, :edit, :index, :update]

  devise_for :uses,skip: [:birthday], controllers: {
  registrations: "registrations",
  sessions: 'sessions'
  }

end
