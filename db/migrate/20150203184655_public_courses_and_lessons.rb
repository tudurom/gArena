class PublicCoursesAndLessons < ActiveRecord::Migration
  def change
    add_column :courses, :public, :boolean
    add_column :lessons, :public, :boolean
  end
end
