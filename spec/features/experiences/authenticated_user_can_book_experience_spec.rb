require 'rails_helper'


RSpec.describe 'As an authenticated user' do

  xit 'can book an experience' do
    visit experiences_path

    click_on "See Dates"

    expect a popup

    expect(popup).to have_content("insert date")
    expect(popup).to have_content("insert date")
    expect(popup).to have_content("insert date")

    within.first('.experience-date') do
      click_on "Book Now"
    end

    expect(page).to have_content('Thanks for choosing #{experience.title}')
    expect(page).to have_content("You'll receive an email with confirmation details.")
    expect(page).to have_content('insert details about the experience order')
  end

end
