class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.belongs_to :lesson, index: true
      t.string :title
      t.text :content
      t.string :student
      t.datetime :time

      t.timestamps null: false
    end
  end
end
