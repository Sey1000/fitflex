class RemoveDateFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :date, :datetime
  end
end
