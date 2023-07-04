Rails.application.routes.draw do
  resources :shelves
  scope "(:locale)" do
    post '/auth/login', to: 'authentication#login'
    post '/auth/register', to: 'authentication#register'
    put '/auth/confirmation-email', to: 'authentication#confim_email'

    get 'shelves' , to: 'shelves#index'
  end
end
