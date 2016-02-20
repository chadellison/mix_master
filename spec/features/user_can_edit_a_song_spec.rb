require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "they see a flash message once the individual song is updated" do

    artist = create(:artist)
    songs = artist.songs.create(title: "Many Loves")

    visit song_path(songs.id)
    click_on "Edit"
    fill_in "Title", with: "A Song About Jones"
    click_on "Update Song"

    expect(page).to have_content "A Song About Jones"
  end
end
