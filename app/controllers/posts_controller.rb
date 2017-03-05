class PostsController < ApplicationController

  def index
    puts 'here'
    @title = 'Blog'
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.sorted_by_publish_date
    end
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
    redirect_to posts_path unless @post.published
  end
end
