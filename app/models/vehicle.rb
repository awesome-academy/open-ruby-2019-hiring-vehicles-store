class Vehicle < ApplicationRecord
  VEHICLE_PARAMS =
    %i(name quantity category_id branch_id description price).freeze

  belongs_to :category
  belongs_to :branch
  has_many :hirings, dependent: :destroy
  has_many :comments
  delegate :name, to: :category, prefix: :category
  delegate :name, to: :branch, prefix: :branch

  scope :active_vehicles, ->{where.not quantity: Settings.sold_out}
end
