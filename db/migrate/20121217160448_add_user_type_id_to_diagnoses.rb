class AddUserTypeIdToDiagnoses < ActiveRecord::Migration
  def change
    add_column :diagnoses, :user_type_id, :integer

  end
end
