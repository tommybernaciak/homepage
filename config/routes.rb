Rails.application.routes.draw do
  root 'application#about'
  get '/contact', to: 'application#contact'
  resources :posts do
    get '/posts', to: 'posts#index'
    get '/posts/:id', to: 'posts#show'
  end
  namespace :admin do
    get '/', to: 'admin#dashboard'
    resources :posts
  end
end
