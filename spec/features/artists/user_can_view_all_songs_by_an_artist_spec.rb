require "rails_helper"

RSpec.feature "user can view all songs by an artist" do
  scenario "user sees a list of all songs alphabetically and linked" do
    artist = create(:artist)
    song = artist.songs.create(title: "Many Loves")
    song_two = artist.songs.create(title: "ABCs")
    song_three = artist.songs.create(title: "Portland")

    visit artist_path(artist.id)
    click_on "View Songs"
    expect(page).to have_content "ABCs"
    expect(page).to have_content "Many Loves"
    expect(page).to have_content "Portland"
    click_on "ABCs"
    expect(current_path).to eq song_path(song_two.id)
  end
end
