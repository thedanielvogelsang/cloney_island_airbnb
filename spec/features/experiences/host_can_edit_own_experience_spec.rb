require 'rails_helper'

RSpec.describe 'As a host with experiences' do
  #create host with experiences, count experiences and match count to experiences list below.
  context 'it can see and edit its experiences' do

    xit 'can see edit page' do
      visit host_dashboard_index_path

      within('.host-experiences') do
        expect(page).to have_content(host.experience.title) #all the titles
        expect(page).to have_link(edit_experience_path(host.experiences.first.id))
        click_link "Edit Experience" #pass in specific link to this listing
      end

      expect(path).to eq("/experience/#{host.experience.first.id}/edit")

      within('edit-experience-box') do
        expect(page).to have_field("Category", :value => experience.category) #Check boxes
        expect(page).to have_field("Title", :value => experience.title) #Text field
        expect(page).to have_field("Time", :value => experience.duration.) #Text field
        expect(page).to have_field("Tagline", :value => experience.tagline.) #Text box
        expect(page).to have_field("Photos", :value => experience.image.) # Photo upload
        expect(page).to have_field("What", :value => experience.what) #Text box
        expect(page).to have_field("Where", :value => experience.where) #Text box
        expect(page).to have_field("Provisions", :value => experience.provisions) #Text box
        expect(page).to have_field("Notes", :value => experience.notes) #Text box
      end

    end

    xit 'it can edit an experience' do
      within('edit-experience-box') do
        select "Business", from: "Category"
        fill_in "Title", with: "Stupendous New Experience Title"
        fill_in "Provisions", with: "Tons of mac & cheese."
        click_on "Submit Changes"
      end

      expect(path).to eq(experiences_path(experience.id))
      expect(page).to have_content("Stupendous New Experience Title")
      expect(page).to have_content("Tons of mac & cheese.")
      expect(page).not_to have_content('old title')
      expect(page).not_to have_content("old provisions")
    end

    xit 'it can delete an experience' do
      click_on "Delete Experience"
      expect(page).to have_flash_message("Experience Successfully Deleted")
      expect(path).to eq(experiences_path)
    end
    
  end
end
