require "rails_helper"

RSpec.feature "User can delete an artist" do
  scenario "User sees the page for an individual artist" do

    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: "Bob Marley", image_path: artist_image_path)
    jones = Artist.create(name: "Jones", image_path: artist_image_path)

    visit artist_path(jones.id)
    click_on "Delete"
    expect(current_path).to eq artists_path
    expect(page).to have_no_content('Jones')
  end
end
