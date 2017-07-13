require 'rails_helper'

RSpec.feature "Guest can become user", type: :feature do
  scenario "guest registers successfully" do
    visit root_path

    click on "Sign Up"

    expect(page).to have_content("Sign up with Facebook")
    expect(page).to have_content("Sign in with email")
    click_on "Sign in with email"

    expect(current_path).to eq(new_user_registration_path)

    fill_in :first_name, with: "Bob"
    fill_in :last_name, with: "Ross"
    fill_in :email, with: "paint_with_squirrels@bobross.com"
    fill_in :phone_number, with: "303-867-5309"
    fill_in :birthday, with: "05-16-1990"
    # fill_in :image_url, with: "https://fakeimage.jpg"
    fill_in :password, with: "paint"
    fill_in :password_confirmation, with: "paint"
    click_on "Sign up"

    expect(current_path).to eq(root_path)

    expect(flash[:alert]).to match(/You have signed up successfully./)
  end
end
