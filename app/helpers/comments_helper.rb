module CommentsHelper
  def check_commentable comment
    comment.commentable_type == Settings.comment_type
  end
end