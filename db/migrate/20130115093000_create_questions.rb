class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :section_id
      t.text :content

      t.timestamps
    end
  end
end
