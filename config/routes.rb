Rails.application.routes.draw do
    resource :sessions, only: :create
    get '/signin' => 'sessions#new', as: :new_sessions
    
    resource :users
    root 'application#home'
    
end

#rails s -p $PORT -b $IP