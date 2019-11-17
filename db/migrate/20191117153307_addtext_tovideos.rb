class AddtextTovideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :text, :text
  end
end
