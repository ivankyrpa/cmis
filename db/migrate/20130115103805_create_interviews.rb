class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :pacient_id
      t.date :interview_date

      t.timestamps
    end
  end
end
