Rails.application.routes.draw do
  devise_for :users
  post 'rides/ride', as: :ride  

  resources :attractions 

    resources :sessions, only: :create
    get '/logout' => 'sessions#destroy', as: :logout
    get '/signin' => 'sessions#new', as: :new_sessions
    
    resources :users
    root 'application#home'
    
end

#rails s -p $PORT -b $IP
#page.find("a[href='/users/new']").text