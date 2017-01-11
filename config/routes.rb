Rails.application.routes.draw do
  root 'posts#index'
  get '/me', to: 'application#me'
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: "tag"
  namespace :admin do
    get '/', to: 'admin#dashboard'
    resources :posts do
      post '/publish', to: 'posts#publish'
    end
  end
end
