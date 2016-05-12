class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :reply]
  before_action :confirm_admin, only: [:destroy]

	def index
    @categories = Category.all
	end
	
	def destroy
	  @post = Post.find_by_id(params[:id])
	  @post.destroy
	  flash[:notice] = "Post deleted."
	  redirect_to categories_path
	end

  def new
    @section = Section.find_by_id(params[:section_id])

    if @section.nil?
      redirect_to categories_path
    else
      @post = Post.new
    end
  end

  def create
    @section = Section.find_by_id(params[:section_id])

    unless @section.nil?
      @post = @section.posts.create(post_params.merge(user: current_user))
    end
      redirect_to categories_path
  end

  def show
    @post = Post.find_by_id(params[:id])
    @reply = Post.new

    if @post.nil?
      redirect_to categories_path
    end
  end

  def reply
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      render text: 'Post not found', status: :not_found
    else
      @reply = @post.replies.create(reply_params.merge(user: current_user)) 
      redirect_to post_path(params[:id])
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :message)
  end

  def reply_params
    params.require(:post).permit(:message)
  end

end
