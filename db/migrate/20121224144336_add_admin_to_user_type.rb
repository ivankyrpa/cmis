class AddAdminToUserType < ActiveRecord::Migration
  def change
    add_column :user_types, :admin, :boolean, :default => false

  end
end
