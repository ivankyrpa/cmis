class AddPacientIdColumnToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :pacient_id, :integer

  end
end
