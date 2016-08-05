Rails.application.routes.draw do
  resources :projects do
    resources :timers
  end
  resources :users
  post '/login' => 'user_session#create'
  post '/logout' => 'user_session#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
