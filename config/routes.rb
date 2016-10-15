Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'application#about'
  get '/contact', to: 'application#contact'
  resources :posts
  namespace :admin do
    get '/', to: 'admin#dashboard'
    resources :posts do
      post '/publish', to: 'posts#publish'
    end
  end
end
