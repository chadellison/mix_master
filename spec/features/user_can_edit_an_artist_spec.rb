require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the page for the individual artist" do

    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: "Bob Dylan", image_path: artist_image_path)
    jones = Artist.create(name: "Jones", image_path: artist_image_path)

    new_image = "https://lh3.googleusercontent.com/oCfnooOz3zWWqk5EsEduYbWb5x9WCtuJaq1pkxjzzhyHm6FWqhoIeMUpNtvJ3ZnlKJou=w528-h418-p-no"

    visit artist_path(jones.id)
    click_on "Edit"
    fill_in "artist_name" with: "Bob Jones"
    fill_in "artist_path" with: new_image
    click_on "Update Artist"
    expect(page).to have_content "Bob Jones"
    expect(page).to have_content new_image
    expect(current_path).to eq artist_path(artist.id)
  end
end

As a user
Given that an artist exists in the database
When I visit that artist's show page
And I click on "Edit"
And I fill in a new name
And I click on "Update Artist"
Then I should see the artist's updated name
Then I should see the existing image
