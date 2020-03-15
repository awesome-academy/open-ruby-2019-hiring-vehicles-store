class RemovePolymophicAttributeFromComments < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end

  def self.down
    add_column :comments, :commentable_id
    add_column :comments, :commentable_type
  end
end
