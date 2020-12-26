class PostsController < ApplicationController
  #before_action :authenticate_user!
  before_action :user_confirmation, except: :index
  def index
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title,:text,:image).merge(user_id: current_user.id)
  end

  def user_confirmation
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
