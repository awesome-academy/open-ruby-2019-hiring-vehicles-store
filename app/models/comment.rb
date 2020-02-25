class Comment < ApplicationRecord
  COMMENT_PARAMS = %i(content user_id).freeze

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  delegate :name, to: :user, prefix: :user
end
