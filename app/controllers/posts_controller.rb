class PostsController < ApplicationController

  def index
    @title = 'Blog'
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).filtered(params[:all])
    else
      puts Post.filtered(params[:all])
      @posts = Post.filtered(params[:all])
    end
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
    redirect_to posts_path unless @post.published
  end
end
