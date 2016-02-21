require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "each playlist links to the individual playlist page" do

    playlist_one = Playlist.create(name: "Jones Juicy Jams")
    playlit_two = Playlist.create(name: "The Cut")

    visit playlists_path
      expect(page).to have_content "Jones Juicy Jams"
      expect(page).to have_content "The Cut"
      click_on "Jones Juicy Jams"
      expect(current_path).to eq playlist_path(playlist_one.id)
  end
end
