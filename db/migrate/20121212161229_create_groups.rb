class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_type_id
      t.string :name

      t.timestamps
    end
  end
end
