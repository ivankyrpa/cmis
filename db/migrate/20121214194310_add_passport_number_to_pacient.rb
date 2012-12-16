class AddPassportNumberToPacient < ActiveRecord::Migration
  def change
    add_column :pacients, :passport_number, :integer

  end
end
