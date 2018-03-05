Rails.application.routes.draw do
  resources :superpowers, only: [:show, :index]
  resources :superheroes, only: [:show, :index, :new, :create]
  get "/search", to: "superpowers#search"

end
