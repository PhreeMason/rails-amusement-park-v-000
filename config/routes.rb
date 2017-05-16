Rails.application.routes.draw do
    resources :sessions, only: :create
    get '/signin' => 'sessions#new', as: :new_sessions
    
    resources :users
    root 'application#home'
    
end

#rails s -p $PORT -b $IP
#page.find("a[href='/users/new']").text
#<%= link_to "Sign in", new_sessions_path %>