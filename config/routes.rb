Rails.application.routes.draw do
  delete '/logout',                  to: 'sessions#destroy'
  get    '/auth/:provider/callback', to: 'sessions#create'

  get  '/dashboard', to: 'dashboard#show'
  root 'home#show'
  resources :users
  #
  # devise_for :users
  #
  # authenticated :user do
  #   root 'users#index'
  # end
  #
  # unauthenticated :user do
  #   devise_scope :user do
  #     get "/" => "devise/sessions#new"
  #   end
  # end

  resources :conversations do
    resources :messages
  end
end
