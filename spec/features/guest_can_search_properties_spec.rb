require 'rails_helper'

RSpec.feature "Guest can search properties", type: :feature do
  scenario "guests can search by city" do
    skip
    property = create(:property)

    visit root_path

    within(".search_bar") do
      expect(page).to have_field("city")
      expect(page).to have_field("zipcode")
      expect(page).to have_field("check_in")
      expect(page).to have_field("check_out")
      expect(page).to have_selector(:link_or_button, 'Search')
    end

    fill_in "city", with: "#{property.city}"
    fill_in "state", with: "#{property.state}"
    click_on "Search"

    expect(current_path).to eq(properties_path)

    within(".results") do
      expect(page).to have_content(property.name)
      expect(page).to have_css("img[src*='#{property.image_url}']")
      expect(page).to have_selector('#markers img', count: 1)
    end
  end

  scenario "can search by zipcode" do
    skip
    create(:user, role: 0)
    property = create(:property)

    visit root_path

    within(".search_bar") do
      expect(page).to have_field("city")
      expect(page).to have_field("zipcode")
      expect(page).to have_field("check_in")
      expect(page).to have_field("check_out")
      expect(page).to have_selector(:link_or_button, 'Search')
    end

    fill_in "zipcode", with: "#{property.zipcode}"
    click_on "Search"

    expect(current_path).to eq(properties_path)

    within(".results") do
      expect(page).to have_content(property.name)
      expect(page).to have_css("img[src*='#{property.image_url}']")
      expect(page).to have_selector('#markers img', count: 1)
    end
  end

  scenario "guest can search by dates" do
    skip
    create(:user, role: 0)
    property_1 = create(:property)
    property_2 = create(:property)
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
