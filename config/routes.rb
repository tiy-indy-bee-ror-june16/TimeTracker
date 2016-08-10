Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :projects do
    resources :timers
    resources :users, only: [:show, :create, :new, :edit, :update]
  end
  resources :users
  #idk if this is right, but I'm trying to get a page with the timers for a specific user on a specific project.
  post '/login' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'
  post 'projects/assign_user' => 'projects#assign_user'
  post 'projects/invite_user_to_project' => 'projects#invite_user_to_project'
  post 'projects/invite_client_to_projects' => 'projects#invite_client_to_projects'
  root 'projects#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
