class CommentsController < ApplicationController
  def create
    createComment = Comment.new(params_comment)
    createComment.user_id = current_user.id
    createComment.list_id = params[:list_id]
    createComment.save
    redirect_back fallback_location: root_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back fallback_location: root_path
  end

  private

  def params_comment
    params.require(:comment).permit(:comment)
  end
end