class Branch < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  BRANCH_PARAMS = %i(name).freeze
end
