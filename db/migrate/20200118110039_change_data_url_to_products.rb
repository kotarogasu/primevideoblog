class ChangeDataUrlToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :link, :text
  end
end
