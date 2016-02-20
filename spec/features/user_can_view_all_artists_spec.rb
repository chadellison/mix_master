require 'rails_helper'

RSpec.feature "User can view the index page of all artists" do
  scenario "user sees all artists" do

    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: "Bob Dylan", image_path: artist_image_path)
    jones = Artist.create(name: "Jones", image_path: artist_image_path)

    visit artists_path
    expect(page).to have_content "All Artists"
    expect(page).to have_content "Bob Dylan"

    expect(page).to have_content "Jones"
    click_on "Bob Dylan"
    expect(current_path).to eq artist_path(artist.id)
  end
end
