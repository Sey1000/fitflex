class AddFloatDistanceToStudios < ActiveRecord::Migration[5.0]
  def change
    add_column :studios, :distance, :float
  end
end
