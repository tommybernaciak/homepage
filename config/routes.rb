Rails.application.routes.draw do
  root 'application#mainpage'
  get '/admin', to: 'application#admin'
end
