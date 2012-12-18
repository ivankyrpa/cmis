class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :pacient_id
      t.integer :assignment_id
      t.integer :diagnosis_id
      t.date :date_accessed
      t.text :complaints
      t.text :recommendation
      t.string :doctor_name

      t.timestamps
    end
  end
end
