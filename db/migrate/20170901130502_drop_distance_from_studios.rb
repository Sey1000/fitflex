class DropDistanceFromStudios < ActiveRecord::Migration[5.0]
  def change
    remove_column :studios, :distance
  end
end
