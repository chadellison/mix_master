class UpdatePlaylistTable < ActiveRecord::Migration
  def change
    change_table :playlists do |t|
      t.string :name
    end
  end
end
