class RemoveAreaFromInstructors < ActiveRecord::Migration[5.0]
  def change
    remove_column :instructors, :area, :string
  end
end
