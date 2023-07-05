Rails.application.routes.draw do
  scope "(:locale)"  do
    scope :api do
      post '/auth/login', to: 'authentication#login'
      post '/auth/register', to: 'authentication#register'
      put '/auth/confirmation-email', to: 'authentication#confim_email'

      get 'shelves' , to: 'shelves#index'
      get 'categories' , to: 'categories#index'
    end
  end
end
