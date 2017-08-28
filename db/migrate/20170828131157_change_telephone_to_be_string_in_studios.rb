class ChangeTelephoneToBeStringInStudios < ActiveRecord::Migration[5.0]
  def change
    change_column :studios, :telephone, :string
  end
end
