class AddFromToAgeGroup < ActiveRecord::Migration
  def change
    add_column :age_groups, :from, :integer

  end
end
