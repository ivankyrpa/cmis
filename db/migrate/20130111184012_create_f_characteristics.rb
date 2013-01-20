class CreateFCharacteristics < ActiveRecord::Migration
  def change
    create_table :f_characteristics do |t|
      t.integer :group_id
      t.string :name
      t.float :norm_c
      t.float :norm_sc
      t.float :norm_dc
      t.float :dev_c
      t.float :dev_sc
      t.float :dev_dc

      t.timestamps
    end
  end
end
