class CreateCharacteristicsSurveys < ActiveRecord::Migration
  def change
    create_table :characteristics_surveys do |t|
      t.integer :survey_id
      t.integer :characteristic_id
      t.float :value
      t.integer :result

      t.timestamps
    end
  end
end
