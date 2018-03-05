Rails.application.routes.draw do
  resources :superpowers, only: [:index, :show]
  resources :superheroes, only: [:index, :show, :new, :create, :destroy]

  get "/search", to: "superheroes#filtered"

end
