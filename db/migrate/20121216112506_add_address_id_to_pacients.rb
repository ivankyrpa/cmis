class AddAddressIdToPacients < ActiveRecord::Migration
  def change
    add_column :pacients, :address_id, :integer

  end
end
