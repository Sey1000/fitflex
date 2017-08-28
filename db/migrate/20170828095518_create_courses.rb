class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.float :cost
      t.integer :spots
      t.string :description
      t.string :category
      t.string :level
      t.references :studio, foreign_key: true

      t.timestamps
    end
  end
end
