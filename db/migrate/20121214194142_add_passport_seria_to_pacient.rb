class AddPassportSeriaToPacient < ActiveRecord::Migration
  def change
    add_column :pacients, :passport_seria, :integer

  end
end
