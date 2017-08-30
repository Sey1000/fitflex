class ChangeContentFromStringToTextInReviews < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :content, :text
  end
end
