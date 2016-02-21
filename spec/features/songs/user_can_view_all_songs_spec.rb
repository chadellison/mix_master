require "rails_helper"

RSpec.feature "user can view all songs" do
  scenario "user sees a list of all songs" do
    artist = create(:artist)
    jones = Artist.create(name: "Jones", image_path: "https://lh3.googleusercontent.com/-gM1HTygeDfA/UsesHgS_9jI/AAAAAAAAAhU/eqFUywxtHP0/w852-h1082/Al.JPG")

    song = artist.songs.create(title: "Many Loves")
    song_two = artist.songs.create(title: "ABCs")
    song_three = jones.songs.create(title: "A Jonesy Song")

    visit songs_path
    expect(page).to have_content "All Songs"
    expect(page).to have_content "ABCs"
    expect(page).to have_content "Many Loves"
    expect(page).to have_content "A Jonesy Song"
    click_on "A Jonesy Song"
    expect(current_path).to eq song_path(song_three.id)
  end
end
