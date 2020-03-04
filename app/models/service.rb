class Service < ApplicationRecord
  belongs_to :vehicle

  validates :name, presence: true,
    length: {maximum: Settings.vehicle_name_length_max}
  validates :price, presence: true
end
