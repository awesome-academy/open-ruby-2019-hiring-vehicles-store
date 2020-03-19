class Comment < ApplicationRecord
  COMMENT_PARAMS = %i(content user_id vehicle_id parent_id).freeze

  belongs_to :user
  belongs_to :vehicle

  acts_as_tree order: "created_at ASC"

  delegate :name, to: :user, prefix: :user

  scope :parent_comments, ->{where parent_id: nil}
end
