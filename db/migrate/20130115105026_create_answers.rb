class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :interview_id
      t.integer :question_id
      t.integer :rating

      t.timestamps
    end
  end
end
