Rails.application.routes.draw do
  resources :superpowers, only: [:index, :show]
  resources :superheroes, only: [:index, :show, :new, :create]
  get '/search', to: 'superpowers#search'

end
