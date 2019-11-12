class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.text :title, null: false
      t.text :detail, null: false
      t.string :genre, null: false
      t.string :link, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end