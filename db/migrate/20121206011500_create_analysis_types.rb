class CreateAnalysisTypes < ActiveRecord::Migration
  def change
    create_table :analysis_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
