class PostsController < ApplicationController

  def index
    @title = 'Blog'
    @posts = Post.sorted_by_publish_date
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
    redirect_to posts_path unless @post.published
  end
end
