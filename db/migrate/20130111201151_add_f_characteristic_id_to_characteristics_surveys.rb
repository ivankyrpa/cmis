class AddFCharacteristicIdToCharacteristicsSurveys < ActiveRecord::Migration
  def change
    add_column :characteristics_surveys, :f_characteristic_id, :integer

  end
end
