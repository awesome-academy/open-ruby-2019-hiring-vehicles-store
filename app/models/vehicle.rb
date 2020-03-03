class Vehicle < ApplicationRecord
  include SearchCop

  VEHICLE_PARAMS =
    %i(name quantity category_id branch_id description price picture).freeze
  INDEX_PARAMS =
    %i(id name quantity price description category_id branch_id)

  belongs_to :category
  belongs_to :branch
  has_many :hirings, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

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

  search_scope :search do
    attributes all: %i(name description)
    options :all, type: :fulltext, default: true
  end

  private

  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, t(".less")
  end
end
