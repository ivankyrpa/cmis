class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :record_id
      t.integer :history_id
      t.integer :medicament_id
      t.decimal :amount

      t.timestamps
    end
  end
end
