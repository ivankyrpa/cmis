class AddUniquenessPassport < ActiveRecord::Migration
  def self.up
    add_index :pacients, [:passport_number, :passport_seria], :unique => true
  end

  def self.down
    remove_index :pacients, [:passport_number, :passport_seria]
  end
end
