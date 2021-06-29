Rails.application.routes.draw do
  devise_for :users
  get "/books", to: "books#search"

  get "/book/works/:id/:isbn", to: "books#show"

  post "/reviews", to: "reviews#new"

  get "welcome/index"

  root "welcome#index"
end
