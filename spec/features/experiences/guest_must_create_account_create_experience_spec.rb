require 'rails_helper'

RSpec.describe 'As a guest' do

  xit 'must create an account to book an experience' do
    visit experiences_path

    within.first('experience-box') do
      click_on 'the image'
    end

    expect(path).to be('/experience/:id')
    click_on "Book Now"
    expect('popup').to have_content("You need to sign in or create an account to Book this Experience")
    expect('popup').to have_link("Sign In")
    expect('popup').to have_link("Create an Account")
  end

end
