class AddFulltextToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_index :vehicles, %i(name description), type: :fulltext
  end
end
