class CreateFRecommendations < ActiveRecord::Migration
  def change
    create_table :f_recommendations do |t|
      t.integer :group_id
      t.string :content
      t.decimal :low_c
      t.decimal :high_c
      t.decimal :low_dc
      t.decimal :high_dc

      t.timestamps
    end
  end
end
