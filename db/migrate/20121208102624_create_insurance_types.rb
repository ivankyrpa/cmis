class CreateInsuranceTypes < ActiveRecord::Migration
  def change
    create_table :insurance_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
