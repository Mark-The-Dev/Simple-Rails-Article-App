Rails.application.routes.draw do
  root "articles#index"

  # lets articles populate comments nested within articles
  resources :articles do
    resources :comments
  end
end


  # resources :articles // sets all crud requests to articles

  # get "/articles", to: "articles#index" // get request to index
  # get "/articles/:id", to: "articles#show" // get request to show
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
