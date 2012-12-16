class CreatePacients < ActiveRecord::Migration
  def change
    create_table :pacients do |t|
      t.string :lastname
      t.string :middlename
      t.string :firstname
      t.date :birthdate
      t.boolean :sex
      t.string :phone
      t.integer :address_id
      t.integer :age_group_id
      t.integer :blood_group_id

      t.timestamps
    end
  end
end
