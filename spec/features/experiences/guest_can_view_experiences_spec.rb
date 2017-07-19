require 'rails_helper'

RSpec.describe 'Guest visits /experiences' do

  xit 'can view all experiences' do
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

  context 'can view a single experience' do

    before(:each) do
      experiences = create_list(:experience, 4)
      @experience = experiences.first
      id = @experience.id
      visit experiences_path
      within("#experience-#{id}") do
        find(:xpath, "//a[@href='/experiences/#{id}']").click
      end
      expect(current_path).to eq("/experiences/#{id}")
    end

    it 'can see title block' do
      within('.experience-title-box') do
        expect(page).to have_content(@experience.title)
        expect(page).to have_content(@experience.city)
        expect(page).to have_content(@experience.description)
      end
    end

    xit 'can see category box' do
      within('.experience-category-box') do
        expect(page).to have_content(@experience.category)
        expect(page).to have_content("Hosted by: #{@experience.host.name}")
        #expect(page).to have_image('small host profile pic')
        expect(page).to have_content(@experience.duration)
        expect(page).to have_content(@experience.provisions)
      end
    end

    xit 'can see featured image block' do
      within('.experience-featured-image') do
        #expect(page).to have the featured image
        expect(page).to have_content("#{@experience.price} per person")
        expect(page).to have_content("See Dates")
      end
    end

    xit 'can view all dates' do
      within('.experience-date') do
        click_on 'See Dates'
        #expect a popup to pop up
        expect(page).to have_content(@experience.dates.first)
        expect(page).to have_content(@experience.dates.last)
        expect(page).to have_content("Book Now", count: 4)
      end
    end

    xit 'can see the what we will do block' do
      within('.experience-what-box') do
        expect(page).to have_content("What We'll Do")
        expect(page).to have_content(@experience.what)
      end
    end

    xit 'can see what the host will provide' do
      expect(page).to have_content("What I'll Provide")
      expect(page).to have_content(@experience.provisions)
    end

    xit 'can see notes on the experience' do
      expect(page).to have_content('Notes')
      expect(page).to have_content(@experience.notes)
    end

    xit 'can see where the experience will be on a map' do
      expect(page).to have_content("Where We'll Be")
      expect(page).to have_css('.experience-map')
      #how to test for map accuracy?
    end

    xit 'can see a brief host description' do
      within('.host-block') do
        expect(page).to have_content("About your host, #{@experience.host.name}")
        #this should be unique for each experience so the host can brand himself/herself according to the experience
        expect(page).to have_content(@experience.host_description)
      end
    end

    xit 'can see a link to message the host' do
      within('.host-contact') do
        expect(page).to have_link('Contact Host')
      end
    end

    xit 'can view available dates' do
      within('.available-dates') do
        expect(page).to have_link("See All Dates")
      end
    end

    xit 'can see reviews for the experience' do
      within('.experience-reviews') do
        expect(page).to have_content('Reviews')
        expect(page).to have_content(@experience.reviews.first.content)
        expect(page).to have_content(@experience.reviews.first.title)
        expect(page).to have_content(@experience.reviews.first.name)
      end
    end

    xit 'can see the extra info about the experience' do
      expect(page).to have_content("Extra Info")
      expect(page).to have_content(@experience.group_size)
      expect(page).to have_content(@experience.guest_requirements)
      expect(page).to have_content(@experience.cancellation_policy_type)
    end

  end

end
