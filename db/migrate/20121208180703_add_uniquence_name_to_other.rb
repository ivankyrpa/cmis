class AddUniquenceNameToOther < ActiveRecord::Migration
  def self.up
    add_index :operations, :name, :unique => true
    add_index :blood_groups, :name, :unique => true
    add_index :treatment_types, :name, :unique => true
    add_index :medicaments, :name, :unique => true
    add_index :symptoms, :name, :unique => true
    add_index :diagnoses, :name, :unique => true
    add_index :analysis_types, :name, :unique => true
  end

  def self.down
    remove_index :operations, :name
    remove_index :blood_groups, :name
    remove_index :treatment_types, :name
    remove_index :medicaments, :name
    remove_index :symptoms, :name
    remove_index :diagnoses, :name
    remove_index :analysis_types, :name
  end
end
