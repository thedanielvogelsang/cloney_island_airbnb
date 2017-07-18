require 'rails_helper'

RSpec.describe 'As a traveler' do

  context 'can create a new listing' do

    xit 'adds host to user roles' do
      visit root_path
      hover_on 'Become a Host'
      click_on 'Host an Experience'

      expect(path).to be(new_experience_path)
      expect(page).to have_css("input#post_title", :value => "Category")
    end
  end
end
