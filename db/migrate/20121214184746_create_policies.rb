class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.string :number
      t.integer :insurance_company_id
      t.integer :insurance_type_id
      t.integer :pacient_id

      t.timestamps
    end
  end
end
