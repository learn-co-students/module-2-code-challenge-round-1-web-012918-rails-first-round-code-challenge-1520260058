Rails.application.routes.draw do

  root 'application#welcome'

  resources :superpowers, only: [:index, :show]
  resources :superheroes

end
