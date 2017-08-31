class AddCldIdToStudios < ActiveRecord::Migration[5.0]
  def change
    add_column :studios, :cld_id, :string
  end
end
