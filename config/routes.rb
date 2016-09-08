Rails.application.routes.draw do
  root 'application#mainpage'
  get '/admin', to: 'application#admin'
  get '/blog', to: 'application#blog'
  get '/contact', to: 'application#contact'
end
