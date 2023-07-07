Rails.application.routes.draw do
  scope "(:locale)"  do
     namespace :api do
        post '/auth/login', to: 'authentication#login'
        post '/auth/register', to: 'authentication#register'
        put '/auth/confirmation-email', to: 'authentication#confim_email'

        get 'shelves' , to: 'shelves#index'
        get 'categories' , to: 'categories#index'
        get 'authors' , to: 'authors#index'
        get 'books' , to: 'books#index'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
