class AddCodeToDiagnosis < ActiveRecord::Migration
  def change
    add_column :diagnoses, :code, :integer

  end
end
