Rails.application.routes.draw do
  root "users#top"
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  #"users#show"








  # get "/" => "users#show"
  # get "/users/#{id}/edit", to: "users#edit", as: "edit_user"
  # # get "/user/edit" => "users#edit"
  # put "/user/update" => "users#update"

  # get "/users/:id/edit", to: "users#edit", as: "edit_user"

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
