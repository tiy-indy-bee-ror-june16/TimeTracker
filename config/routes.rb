Rails.application.routes.draw do
  resources :projects do
    resources :timers
  end
  resources :users
  post '/login' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'

  root 'projects#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
