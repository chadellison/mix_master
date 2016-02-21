require "rails_helper"

RSpec.feature "User can delete a song" do
  scenario "User sees the page of all remaining songs for that artist" do

    artist = create(:artist)

    song = artist.songs.create(title: "Many Loves")
    song_two = artist.songs.create(title: "ABCs")
    song_three = artist.songs.create(title: "A Jonesy Song")
    song_four = artist.songs.create(title: "Green")

    visit artist_path(artist.id)
    click_on "View Songs"
    expect(current_path).to eq "/artists/#{artist.id}/songs"
    expect(page).to have_content('Many Loves')
    expect(page).to have_content('Green')
    # Capybara.current_session.driver.delete song_path(song_four.id)
    # expect(page).to have_no_content('Green')
    # expect(current_path).to eq songs_path

  end
end
