class AddVehicleIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :vehicle, foreign_key: true
  end
end
