class CreateStudios < ActiveRecord::Migration[5.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :telephone

      t.timestamps
    end
  end
end
