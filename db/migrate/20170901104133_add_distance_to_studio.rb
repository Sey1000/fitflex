class AddDistanceToStudio < ActiveRecord::Migration[5.0]
  def change
    add_column :studios, :distance, :string
  end
end
