require 'rails_helper'

RSpec.describe 'Authenticated user visits /experiences' do

  it 'can view all experiences' do
    listing = create(:listing)
    listing.listing_images.create!(property_image: File.new("#{Rails.root}/lib/assets/baby_penguin.jpg"))

    host_role = create(:role, name: "host")
    user = create(:user)
    user.roles << host_role
    experiences = create_list(:experience, 4)
    experiences.each do |e|
      e.experience_images.create!(image: File.new("#{Rails.root}/lib/assets/baby_penguin.jpg"))
    end

    visit root_path
    within('.navbar-user-types.sub') do
      click_on 'Experiences'
    end

    expect(current_path).to eq('/experiences')

    within('.experiences-box') do
      expect(page).to have_content(experiences[0].title)
      expect(page).to have_content(experiences[1].title)
      expect(page).to have_content(experiences[2].title)
      expect(page).to have_content(experiences[3].title)

      expect(page).to have_css('img', count: 4)

      expect(page).to have_content(experiences[0].price)
      expect(page).to have_content(experiences[1].price)
      expect(page).to have_content(experiences[2].price)
      expect(page).to have_content(experiences[3].price)
    end

  end

  it 'views a single experience' do
    host_role = create(:role, name: "host")
    user = create(:user)
    user.roles << host_role
    experiences = create_list(:experience, 4)
    experience = experiences.first
    id = experience.id
    experiences.each do |e|
      e.experience_images.create!(image: File.new("#{Rails.root}/lib/assets/baby_penguin.jpg"))
    end

    visit experiences_path

    within first('.experience-image') do
      find(:xpath, "//a[@href='/experiences/#{id}']").click
    end

    expect(current_path).to eq("/experiences/#{experience.id}")

    within('.experience-title-box') do
      expect(page).to have_content(experience.title)
      expect(page).to have_content(experience.city)
      expect(page).to have_content(experience.tagline)
    end

    within('.experience-category-box') do
      expect(page).to have_content("Hosted by: #{experience.user.full_name}")
      expect(page).to have_css('.host-profile-pic img')
      expect(page).to have_content(experience.duration)
      expect(page).to have_content(experience.provisions)
    end

    within('.experience-featured-image') do
      expect(page).to have_css('img')
      expect(page).to have_content("$#{experience.price} per person")
      #expect(page).to have_content('See Dates')
      #expect(page).to have_css('.social-sharing .facebook')
      #expect(page).to have_css('.social-sharing .twitter')
    end

    within('.experience-what-box') do
      expect(page).to have_content("What We'll Do")
      expect(page).to have_content(experience.what)
    end

    within('.experience-host-provides-box') do
      expect(page).to have_content("What I'll Provide")
      expect(page).to have_content(experience.provisions)
    end

    within('.experience-notes-box') do
      expect(page).to have_content('Notes')
      expect(page).to have_content(experience.notes)
    end

    within('.experience-where-box') do
      expect(page).to have_content("Where We'll Be")
      expect(page).to have_content(experience.where)
    end

    within('.host-block') do
      expect(page).to have_content("About your host, #{experience.user.first_name}")
      expect(page).to have_content(experience.host_description)
    end

    within('.host-contact') do
      #expect(page).to have_content('Contact Host') #links to messaging system
    end

    within('.experience-extras') do
      expect(page).to have_content("Group Size: #{experience.group_size}")
      expect(page).to have_content("Guest Requirements: #{experience.guest_requirements}")
      expect(page).to have_content("Cancellation Policy Type: #{experience.cancellation_policy_type}")
    end

  end
end
