class ChangeColumnNameInAgeGroups < ActiveRecord::Migration
  def change
    rename_column :age_groups, :name, :from
  end
end
