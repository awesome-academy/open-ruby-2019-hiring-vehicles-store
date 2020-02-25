class CommentsController < ApplicationController
  before_action :load_commentable, only: :create

  def new
    @comment = Comment.find_by id: params[:comment_id]
    @reply = Comment.new
  end

  def create
    @commentable.comments.build comment_params

    if @commentable.save
      respond_to :html, :js
    end
  end

  private

  def load_commentable
    if params[:vehicle_id]    
      @commentable = Vehicle.find_by id: params[:vehicle_id]
      @vehicle = @commentable
    elsif params[:comment_id]
      @commentable = Comment.find_by id: params[:comment_id]
      @vehicle = @commentable.commentable
    else
      redirect_to root_url
      flash[:danger] = t ".cant_find"
    end
  end

  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end
end
