class RenameVideosToTweets < ActiveRecord::Migration[5.2]
  def change
    rename_table :videos, :tweets
  end
end
