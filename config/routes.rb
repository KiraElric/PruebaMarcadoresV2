Rails.application.routes.draw do
  resources :bookmarks
  resources :categories
  resources :types

  get '/api/v1/category/:id', to: 'categories#api_details'

  root to: 'bookmarks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
