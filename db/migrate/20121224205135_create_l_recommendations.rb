class CreateLRecommendations < ActiveRecord::Migration
  def change
    create_table :l_recommendations do |t|
      t.integer :group_id
      t.text :content_o
      t.text :content_c
      t.text :content_d
      t.integer :low
      t.integer :high
      t.integer :min

      t.timestamps
    end
  end
end
