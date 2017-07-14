require 'rails_helper'

RSpec.feature "Guest can search properties", type: :feature do
  scenario "guests can search by city" do
    listing = create(:listing)

    visit root_path

    within(".search_bar") do
      expect(page).to have_field("city")
      expect(page).to have_field("zipcode")
      expect(page).to have_field("check_in")
      expect(page).to have_field("check_out")
      expect(page).to have_selector(:link_or_button, 'Search')
    end

    fill_in "city", with: "#{listing.address.city}"
    fill_in "state", with: "#{listing.address.state}"
    click_on "Search"

    expect(current_path).to eq(search_path)

    within(".results") do
      expect(page).to have_content(listing.name)
      #expect(page).to have_css("img[src*='#{listing.image_url}']")
      #expect(page).to have_selector('#markers img', count: 1)
    end
  end

  scenario "guests can search by zipcode" do
    listing = create(:listing)

    visit root_path

    fill_in "zipcode", with: "#{listing.address.zip_code}"
    click_on "Search"

    expect(current_path).to eq(search_path)

    within(".results") do
      expect(page).to have_content(listing.name)
    end
  end

  scenario "guest can search by dates" do
    listing = create(:listing)
    create(:user, role: 0)
    property_availability = create(:property_availability, property: property_1, date: Date.today, reserved?: false)
    property_availability = create(:property_availability, property: property_1, date: Date.tomorrow, reserved?: true)
    property_availability = create(:property_availability, property: property_2, date: Date.today, reserved?: false)
    property_availability = create(:property_availability, property: property_2, date: Date.tomorrow, reserved?: false)

    visit root_path

    within(".search_bar") do
      expect(page).to have_field("city")
      expect(page).to have_field("zipcode")
      expect(page).to have_field("check_in")
      expect(page).to have_field("check_out")
      expect(page).to have_selector(:link_or_button, 'Search')
    end

    fill_in "Check In", with: "#{Date.today}"
    fill_in "Check Out", with: "#{Date.tomorrow}"
    click_on "Search"

    expect(current_path).to eq(properties_path)

    within(".results") do
      expect(page).to have_content(property_2.name)
      expect(page).to_not have_content(property_1.name)
      expect(page).to have_css("img[src*='#{property_2.image_url}']")
      expect(page).to have_selector('#markers img', count: 1)
    end
  end
end
