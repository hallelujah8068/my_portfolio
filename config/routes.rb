Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/" => "devise/sessions#new"
  end
  resources :users, only: [:show, :edit, :update]
  get '/users/:user_id/skills', to: 'skills#index', as: 'user_skills'
  get '/users/:user_id/skills/:category/new', to: 'skills#new', as: 'new_user_skill'
  post '/users/:user_id/skills/:category/create', to: 'skills#create', as: 'create_user_skill'
  put '/users/:user_id/skills/:id/update', to: 'skills#update', as: 'update_user_skill'
  delete 'users/:user_id/skills/:id', to: 'skills#destroy', as: 'delete_skill'








  # get "/" => "users#show"
  # get "/users/#{id}/edit", to: "users#edit", as: "edit_user"
  # # get "/user/edit" => "users#edit"
  # put "/user/update" => "users#update"

  # get "/users/:id/edit", to: "users#edit", as: "edit_user"

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
