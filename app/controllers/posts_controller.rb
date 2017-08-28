class PostsController < ApplicationController

  def index
    @title = 'Blog'
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).filtered(params[:all])
    else
      @posts = Post.filtered(params[:all])
    end
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
    redirect_to posts_path unless @post.published
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path
  end
end
