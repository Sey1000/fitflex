class RemoveCostFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :cost, :float
  end
end
