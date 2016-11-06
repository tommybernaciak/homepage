Rails.application.routes.draw do
  root 'application#about'
  get '/contact', to: 'application#contact'
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: "tag"
  namespace :admin do
    get '/', to: 'admin#dashboard'
    resources :posts do
      post '/publish', to: 'posts#publish'
    end
  end
end
