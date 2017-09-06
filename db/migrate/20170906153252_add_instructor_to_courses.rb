class AddInstructorToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :instructor, foreign_key: true
  end
end
