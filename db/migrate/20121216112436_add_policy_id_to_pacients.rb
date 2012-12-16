class AddPolicyIdToPacients < ActiveRecord::Migration
  def change
    add_column :pacients, :policy_id, :integer

  end
end
