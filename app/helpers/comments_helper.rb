module CommentsHelper
  def check_commentable comment
    comment.commentable_type == Settings.comment_type
  end

  def comments_tree_for comments, vehicle, comment_new
    safe_join(comments.map do |comment, nested_comments|
      render(comment, vehicle: vehicle,
        comment_new: comment_new) + tree(nested_comments, vehicle)
    end)
  end

  def tree nested_comments, vehicle
    return if nested_comments.empty?
    content_tag :div, comments_tree_for(nested_comments, vehicle, Comment.new)
  end
end
