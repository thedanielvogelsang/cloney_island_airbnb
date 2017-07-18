require 'rails_helper'

RSpec.describe 'As a host' do

  xit 'can create a new listing' do
    visit root_path
    hover_on 'Become a Host'
    click_on 'Host an Experience'

    expect(path).to be(new_experience_path)
    expect(page).to have_field("Category", :value => "Category") #Check boxes
    expect(page).to have_field("Title", :value => "Title") #Text field
    expect(page).to have_field("Time", :value => "Time") #Text field
    expect(page).to have_field("Tagline", :value => "Tagline") #Text box
    expect(page).to have_field("Photos", :value => "Photos") # Photo upload
    expect(page).to have_field("What", :value => "What We'll Do") #Text box
    expect(page).to have_field("Where", :value => "Where We'll Meet") #Text box
    expect(page).to have_field("Provisions", :value => "What I'll Provide") #Text box
    expect(page).to have_field("Notes", :value => "Notes") #Text box

    click_on "Create Experience"

    expect(user.roles).should include('traveler') #make this work!
    expect(user.roles).should include('host') # and this!
  end
end
