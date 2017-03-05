Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'posts#index'
  get '/me', to: 'application#me'
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: "tag"
end
