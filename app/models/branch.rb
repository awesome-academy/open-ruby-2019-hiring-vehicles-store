class Branch < ApplicationRecord
  has_many :vehicles, dependent: :destroy
end
