class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :acter, :text
    add_column :products, :subacter, :text
  end
end
