class RenamepostsTovidos < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts, :videos
  end
end
