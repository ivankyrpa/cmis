class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :pacient_id
      t.integer :diagnosis_id
      t.integer :treatment_type_id
      t.integer :user_id
      t.string :number
      t.date :date_supply
      t.text :description
      t.date :date_extract

      t.timestamps
    end
  end
end
