class Vehicle < ApplicationRecord
  VEHICLE_PARAMS =
    %i(name quantity category_id branch_id description price picture).freeze

  belongs_to :category
  belongs_to :branch
  has_many :hirings, dependent: :destroy
  has_many :comments, as: :commentable
  delegate :name, to: :category, prefix: :category
  delegate :name, to: :branch, prefix: :branch
  validates :quantity, :numericality => { greater_than_or_equal_to: 0 }
  scope :active_vehicles, ->{where.not quantity: Settings.sold_out}
  scope :joins_hirings, ->{joins(:hirings)}
  mount_uploader :picture, PictureUploader

  validate :picture_size
  validates :name, presence: true,
    length: {maximum: Settings.vehicle_name_length_max}
  validates :quantity, presence: true

  private

  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, t(".less")
  end
end
