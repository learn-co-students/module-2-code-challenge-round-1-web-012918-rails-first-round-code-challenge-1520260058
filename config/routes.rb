Rails.application.routes.draw do
  resources :superpowers
  resources :superheroes
  # get '/superheroes', action: 'search'

end
