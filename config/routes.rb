Rails.application.routes.draw do
  resources :projects do
    resources :timers
  end
  resources :users
  post '/login' => 'user_session#create'
  delete '/logout' => 'user_session#destroy'

  root 'project#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
