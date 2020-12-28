class PostsController < ApplicationController
  before_action :authenticate_user! , except: :index
  before_action :find_post, only: [:show, :edit,:update,:destroy]
  before_action :user_confirmation, only: [:edit, :update,:destroy]
  
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
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:text,:image).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def user_confirmation
    unless current_user.id === @post.user_id
      redirect_to root_path
    end
  end
end
