require "rails_helper"

RSpec.feature "User submits a new song" do
  scenario "user sees the individual song page" do

    artist = create(:artist)

    song_title = "One Love"

    visit artist_path(artist)

    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  context "the submitted data is invalid" do
    scenario "user sees an error message" do

      artist = create(:artist)

      visit artist_path(artist.id)
      click_on "New Song"
      expect(current_path).to eq new_artist_song_path(artist.id)
      click_on "Create Song"

      expect(page).to have_content "Title can't be blank"
    end
  end
end
