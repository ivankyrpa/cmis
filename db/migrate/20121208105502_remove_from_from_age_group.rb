class RemoveFromFromAgeGroup < ActiveRecord::Migration
  def change
    remove_column :age_groups, :from
  end
end
