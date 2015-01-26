class AddClass < ActiveRecord::Migration
  def change
    add_column :users, :clazz, :string
  end
end
