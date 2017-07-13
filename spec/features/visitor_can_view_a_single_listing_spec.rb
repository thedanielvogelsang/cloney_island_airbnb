require 'rails_helper'

RSpec.feature "User can see profile", type: :feature do
  scenario "user views profile" do
    listing = create(:listing)
    listing.listing_images.create!(property_image: File.new("#{Rails.root}/lib/assets/baby_penguin.jpg"))

    visit listing_path(listing)

    expect(page).to have_content(listing.name)
    expect(page).to have_content(listing.description)
    expect(page).to have_content(listing.accomodates)
    expect(page).to have_content(listing.bathrooms)
    expect(page).to have_content(listing.beds)
    expect(page).to have_content(listing.price)
    expect(page).to have_content(listing.house_rules)
    expect(page).to have_content(listing.property_type)
    expect(page).to have_content(listing.bed_type)
    expect(page).to have_content(listing.pet_type)
    expect(page).to have_content(listing.room_type)
    expect(page).to have_xpath("//img[contains(@src,'baby_penguin.jpg')]")
  end
end
