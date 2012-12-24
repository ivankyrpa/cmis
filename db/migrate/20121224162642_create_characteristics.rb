class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.integer :group_id
      t.string :name
      t.float :first_value
      t.float :second_value

      t.timestamps
    end
  end
end
