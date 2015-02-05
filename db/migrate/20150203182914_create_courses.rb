class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :subject
      t.string :teacher

      t.timestamps null: false
    end
  end
end
