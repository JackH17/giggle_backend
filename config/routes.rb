Rails.application.routes.draw do
 
  resources :venues
  resources :groups
  resources :events
  resources :users

  namespace :api do
    namespace :v1 do
        resources :venues, only: [:create, :show, :index]  
        resources :groups
        resources :events, only: [:create, :show, :index]  
        resources :users
        resources :posts
        resources :memberships, only: [:create, :index]
        resources :discussions, only: [:create, :show, :index]
        post '/login', to: 'auth#create'
        get '/validate', to: 'auth#validate'
        resources :chats, only: [:index, :create]
        resources :messages, only: [:create, :index]
        mount ActionCable.server => '/cable'
    end
  end
end
