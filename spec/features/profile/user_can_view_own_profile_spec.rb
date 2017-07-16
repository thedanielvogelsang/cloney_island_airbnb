require 'rails_helper'

RSpec.feature "User can see profile", type: :feature do
  scenario "user views profile" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_dashboard_index_path(user)

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.phone_number)
    expect(page).to have_content(user.birthday)
    expect(page).to have_content(user.email)
    expect(page).to have_xpath("//img[contains(@src,'baby_penguin.jpg')]")
  end
end
