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
        post '/login', to: 'auth#create'
        get '/validate', to: 'auth#validate'
    end
  end
end
