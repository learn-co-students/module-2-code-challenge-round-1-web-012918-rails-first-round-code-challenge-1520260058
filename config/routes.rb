Rails.application.routes.draw do
  # resources :superpowers, only: [:index]
  # resources :superheroes, only: [:index]
  resources :superheroes, :superpowers

  
end
