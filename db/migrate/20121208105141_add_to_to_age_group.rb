class AddToToAgeGroup < ActiveRecord::Migration
  def change
    add_column :age_groups, :to, :integer

  end
end
