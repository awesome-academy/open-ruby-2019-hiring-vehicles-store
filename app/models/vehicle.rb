class Vehicle < ApplicationRecord
  VEHICLE_PARAMS =
    %i(name quantity category_id branch_id description price picture).freeze

  belongs_to :category
  belongs_to :branch
  has_many :hirings, dependent: :destroy
  has_many :comments, as: :commentable

  mount_uploader :picture, PictureUploader

  validates :quantity, numericality: {greater_than_or_equal_to: Settings.min_time}
  validates :quantity, numericality: {only_integer: true}
  validate :picture_size
  validates :name, presence: true
  validates :name,  length: {maximum: Settings.vehicle_name_length_max}
  validates :quantity, presence: true

  delegate :name, to: :category, prefix: :category
  delegate :name, to: :branch, prefix: :branch

  scope :active_vehicles, ->{where.not quantity: Settings.sold_out}

  private

  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, t(".less")
  end
end
