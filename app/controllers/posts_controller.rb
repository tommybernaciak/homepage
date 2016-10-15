class PostsController < ApplicationController

  def index
    @title = 'Blog'
    @posts = (Post.published.sort_by &:published_at).reverse
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
    redirect_to posts_path unless @post.published
  end
end
