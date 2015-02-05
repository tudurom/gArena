class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    remove_column :users, :admin # Remove the old-style way to detect admins
  end
end
