require 'rails_helper'

RSpec.describe "Admin can log in" do
  feature "as an admin I can log in" do
    admin = create(:user, role: 3)

    visit login_path

    click on "Log In"

    expect(current_path).to eq(new_user_session_path)

    fill_in :user_email, with: "#{admin.email}"
    fill_in :user_password, with: "#{admin.password}"

    expect(current_path).to eq(root_path)
    expect(flash[:success]).to match(/You have successfully been logged in!/)
    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_content("Logout")
  end
end
