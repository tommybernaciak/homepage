# module Admin
#   class AdminController < ApplicationController
#     # Prevent CSRF attacks by raising an exception.
#     # For APIs, you may want to use :null_session instead.
#     protect_from_forgery with: :exception
#     before_filter :http_basic_auth
#     layout 'admin'

#   def dashboard
#     @all_posts = Post.all.count
#     @published_posts = Post.published.count
#   end
# end
