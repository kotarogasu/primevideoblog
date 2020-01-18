class RenameTweetsToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :tweets, :products
  end
end
