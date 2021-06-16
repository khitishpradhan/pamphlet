Rails.application.routes.draw do

  get "/books", to: "books#search"

  get "/book/works/:id/:isbn", to: "books#show"
  get 'welcome/index'

  root 'welcome#index'
end
