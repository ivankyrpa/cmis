class AddNameUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :cities, :name, :unique => true
    add_index :countries, :name, :unique => true
    add_index :districts, :name, :unique => true
    add_index :regions, :name, :unique => true
    add_index :settlements, :name, :unique => true
    add_index :streets, :name, :unique => true
  end

  def self.down
    remove_index :cities, :name
    remove_index :countries, :name
    remove_index :districts, :name
    remove_index :regions, :name
    remove_index :settlements, :name
    remove_index :streets, :name
  end
end
