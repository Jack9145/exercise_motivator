class CommentsController < ApplicationController
  before_action: user_confirmation, only: [:create,:destroy]
  def create 
    @comment = Comment.create(comment_params)
    find_post
    @comments = @post.comments.includes(:user)
  end

  def destroy
    @comment = Comment.find(params[:id])
    comment_id = @comment.post.id
    @comment.destroy
    redirect_to post_path(comment_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def find_post
    @post = @comment.post
  end 

  def user_confirimation
    unless current_user.id == @comment.id
      redirect_to root_path
    end
  end
end
