class RenameUsersCoursesToCoursesUsers < ActiveRecord::Migration
  def change
    rename_table :users_courses, :courses_users
  end
end
