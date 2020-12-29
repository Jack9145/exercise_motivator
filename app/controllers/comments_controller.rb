class CommentsController < ApplicationController
  def create 
   
    @comment = Comment.create(comment_params)
    find_post
    @comments = @post.comments.includes(:user)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def find_post
    @post = @comment.post
  end 
end
