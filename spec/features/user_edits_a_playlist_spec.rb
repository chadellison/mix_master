require "rails_helper"

RSpec.feature "User can edit a playlist" do
  scenario "User sees the updated playlist" do
    playlist = Playlist.create(name: "Jones Juicy Jams")

    song_one = Song.create(title: "The Jam", artist: create(:artist))
    song_two = Song.create(title: "The Cut", artist: create(:artist))
    playlist.songs << song_one
    playlist.songs << song_two

    new_song = Song.create(title: "This", artist: create(:artist))

    visit playlist_path(playlist.id)
    click_on "Edit"
    fill_in "Name", with: "Frank"
    uncheck("song-#{song_one.id}")
    check("song-#{new_song.id}")

    click_on "Update Playlist"
    expect(page).to have_no_content "Jones Juicy Jams"
    expect(page).to have_content "Frank"
    expect(page).to have_content song_two.title
    expect(page).to have_no_content song_one.title
    expect(page).to have_content "#{new_song.title}"
  end
end
