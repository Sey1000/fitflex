class AddCldToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :cld_id, :string
  end
end
