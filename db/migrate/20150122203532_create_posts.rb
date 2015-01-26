class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.string :content
      t.string :author_name
      t.datetime :time

      t.timestamps null: false
    end
  end
end
