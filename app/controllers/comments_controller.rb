class CommentsController < ApplicationController

  def new
    @comment = Comment.find_by id: params[:comment_id]
    @reply = Comment.new
  end

  def create
    if params[:comment][:parent_id].to_i > Settings.zero
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      @comment = parent.children.build comment_params
    else
      @comment = Comment.new comment_params
    end

    if @comment.save
      respond_to do |format|
        format.html{redirect_to :back}
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end
end
