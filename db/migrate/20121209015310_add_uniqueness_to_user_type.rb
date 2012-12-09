class AddUniquenessToUserType < ActiveRecord::Migration
  def self.up
    add_index :user_types, :name, :unique => true
  end
  
  def self.down
    remove_index :user_types, :name, :unique => true
  end
end
