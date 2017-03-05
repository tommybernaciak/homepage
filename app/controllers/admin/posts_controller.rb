# module Admin
#   class PostsController < AdminController
#   before_action :post, only: [:edit, :update, :show, :destroy]

#   def index
#     @posts = Post.sorted_by_update_date
#   end

#   def new
#     @post = Post.new
#   end

#   def create
#     puts post_params
#     @post = Post.new(post_params)
#     if @post.save
#       flash[:notice] = "Successfully created post!"
#       redirect_to admin_post_path(@post)
#     else
#       flash[:alert] = "Error creating new post!"
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#     if @post.update_attributes(post_params)
#       flash[:notice] = "Successfully updated post!"
#       redirect_to admin_post_path(@post)
#     else
#       flash[:alert] = "Error updating post!"
#       render :edit
#     end
#   end

#   def show
#   end

#   def destroy
#     if @post.destroy
#       redirect_to admin_posts_path
#     else
#       flash[:alert] = "Error updating post!"
#     end
#   end

#   # TODO: use :id instead of :post_id
#   def publish
#     @post = Post.find(params[:post_id])
#     if @post.publish
#       redirect_to admin_posts_path
#     else
#       flash[:alert] = "Error updating post!"
#       redirect_to admin_posts_path
#     end
#   end

#   private

#   def post_params
#     params.require(:post).permit(:title, :body, :short_intro, :published, :all_tags)
#   end

#   def post
#     @post = Post.find(params[:id])
#   end
# end
# end
