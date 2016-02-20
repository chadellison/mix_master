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
end

As a user
Given that artists exist in the database
When I visit the artist songs index
And I click "New song"
And I fill in the title
And I click "Create Song"
Then I should see the song name
And I should see a link to the song artist's individual page
