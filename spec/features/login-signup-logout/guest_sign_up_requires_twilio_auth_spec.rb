require 'rails_helper'

RSpec.feature "Guest user upon signup", type: :feature do
  scenario "is required to input a code that is texted to their phone" do
    skip
    user = build(:user)
    create(:role)

    visit '/'

    within('.navbar-user-types') do
      click_on "Sign Up"
    end

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "t@tty.com"
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Phone number", with: "444-332-5032"
    select "2012", from: "user_birthday_1i"
    select "March", from: "user_birthday_2i"
    select "14", from: "user_birthday_3i"
    fill_in "Password", with: "password"

    within(".create-account-box") do
      click_on "Sign Up"
    end



# After I submit a message appears indicating that I will receive a text message
# A message field also appears asking me to enter the code that will be sent
# Then I receive a text message with the code
# I enter the code into a confirmation box on the screen
# I click submit and I receive a flash message
# The flash message says that my phone number has been verified.


  end
end
