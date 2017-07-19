require 'rails_helper'

RSpec.describe 'Guest visits /experiences' do

  it 'can view all experiences' do
    experiences = create_list(:experience, 4)
    experience = experiences.first
    #image = create(:experience_image)
    #experience.experience_images << image

    visit root_path

    within('.navbar-header') do
      click_on "Experiences"
    end

    expect(current_path).to eq('/experiences')
    expect(page).to have_css('.experiences-box')

    within('.experiences-box') do
      expect(page).to have_css('.experience-card', count: 4)
    end

    within first('.experience-card') do
      expect(page).to have_content(experience.price)
      expect(page).to have_content(experience.title)
      #expect(page).to have_css('.experience-image')
      #expect(page).to have_css('img', count: 4)
    end

  end

  it 'can view a single experience' do
    visit experiences_path

    within first('.experience-card') do
      page.find('img').click
    end

    expect(current_path).to eq(expererience_path)
    
    #and I see within title block, city, brief description
    #and within category block I see the word "Category", "Hosted by: [host_name]", the host's profile picture, experience_duration, experience provisions
    #And on the right I see an experience image, with $price 'per person', date,  and social sharing links
    #And under Title and Category blocks I'll see the "What we'll do" block with a brief description
    #And under that I'll see the "What I provide" block with a description
    #and under that I'll see a "Notes" block with description
    #and under that I'll see a "Where we'll be" block with a description and a map with the location pinned.
    #and under that I'll see a about your host block with words "About your host [host_name]" and a personal description.
    #and under that I'll see a contact link to the host's messaging system
    #and under that I'll see a list of available dates for this experience
    #and then I'll see Reviews
    #and then I'll see Group Size, Guest Requirements, and Cancellation Policy Type
  end

end
