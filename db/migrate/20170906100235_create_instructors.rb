class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :description
      t.integer :age
      t.string :area
      t.references :studio, foreign_key: true

      t.timestamps
    end
  end
end
