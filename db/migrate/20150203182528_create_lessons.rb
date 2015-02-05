class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :course, index: true
      t.string :title
      t.datetime :time
      t.string :teacher
      t.text :content

      t.timestamps null: false
    end
  end
end
