class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :pacient_id
      t.date :survey_date

      t.timestamps
    end
  end
end
