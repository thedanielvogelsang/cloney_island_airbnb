require 'rails_helper'

RSpec.describe 'Authenticated user visits /experiences' do

  xit 'can view all experiences' do

    #create 4 experiences
    visit root_path
    within('navbar-header') do
      click_on 'Experiences'
    end

    expect(path).to eq('/experiences')

    within('.experiences-box') do
      expect(page).to have_content(experience1.title)
      expect(page).to have_content(experience2.title)
      expect(page).to have_content(experience3.title)
      expect(page).to have_content(experience4.title)

      expect(page).to have_content(experience1.image)
      expect(page).to have_content(experience2.image)
      expect(page).to have_content(experience3.image)
      expect(page).to have_content(experience4.image)

      expect(page).to have_content(experience1.price)
      expect(page).to have_content(experience2.price)
      expect(page).to have_content(experience3.price)
      expect(page).to have_content(experience4.price)

      expect(page).to have_css('experiences-box img:hover')
    end

  end

  # context 'views a single experience' do
  #   visit experiences_path
  #
  #   within('.experiences-box') do
  #     click_on ('img')
  #   end
  #
  #   expect(path).to eq("/experience/#{experience.id}")
  #
  #   xit 'can see experience title block' do
  #     within('.experience-box .title') do
  #       expect(page).to have_content(experience.title)
  #       expect(page).to have_content(experience.city)
  #       expect(page).to have_content(experience.description)
  #     end
  #   end
  #
  #   xit 'can see experience category block' do
  #     within('.experience-box .category') do
  #       expect(page).to have_content(experience.category)
  #       expect(page).to have_content("Hosted by: #{experience.host.name}")
  #       expect(page).to have_css('.host-profile-pic img')
  #       expect(page).to have_content(experience.duration)
  #       expect(page).to have_content(experience.provisions)
  #     end
  #   end
  #
  #   xit 'can see experience featured image' do
  #     within('experience-feature-image') do
  #       expect(page).to have_css('img')
  #       expect(page).to have_content("$#{experience.price} per person")
  #       expect(page).to have_content('See Dates')
  #       expect(page).to have_css('.social-sharing .facebook')
  #       expect(page).to have_css('.social-sharing .twitter')
  #     end
  #   end
  #
  #   xit 'can see experience what block' do
  #     within('experience-what') do
  #       expect(page).to have_content("What we'll do")
  #       expect(page).to have_content(experience.what)
  #     end
  #   end
  #
  #   xit 'can see experience provisions block' do
  #     within('experience-provisions') do
  #       expect(page).to have_content("What I'll provide")
  #       expect(page).to have_content(experience.provisions)
  #     end
  #   end
  #
  #   xit 'can see experience notes block' do
  #     within('experience-notes') do
  #       expect(page).to have_content('Notes')
  #       expect(page).to have_content(experience.notes)
  #     end
  #   end
  #
  #   xit 'can see experience where block' do
  #     within('experience-where') do
  #       expect(page).to have_content("Where we'll be")
  #       expect(page).to have_content(experience.where)
  #     end
  #   end
  #
  #   xit 'can see experience host details block' do
  #     within('experience-host') do
  #       expect(page).to have_content("About your host, #{experience.hosts.name}")
  #       expect(page).to have_content(experience.hosts.description)
  #     end
  #   end
  #
  #   xit 'can see experience host contact link' do
  #     within('experience-host-contact') do
  #       expect(page).to have_content('Contact Host') #links to messaging system
  #     end
  #   end
  #
  #   xit 'can see experience availability dates list' do
  #     within('experience-availability-dates') do
  #       expect(page).to have_content('something equaling the availabl dates for this experience')
  #     end
  #   end
  #
  #   xit 'can see experience extras block' do
  #     within('experience-extra') do
  #       expect(page).to have_conent("Group Size: #{experience.group_size}")
  #       expect(page).to have_content("Guest Requirements: #{experience.guest_requirements}")
  #       expect(page).to have_content("Cancellation Policy Type: #{experience.cancellation_policy}")
  #     end
  #   end
  #
  # end
  #
  # context 'the experience belongs_to the current_user' do
  #   #user must be host
  #   xit 'sees an Edit link' do
  #     within('.host-edit-link') do
  #       expect(page).to have_link('Edit your experience')
  #       click_on "Edit your experience"
  #     end
  #
  #     expect(path).to eq(edit_experience_path(experience.id))
  #   end
  # end
  #
  # context 'the experience does not belong to the host' do
  #   xit 'cannot see an Edit your experience link' do
  #     expect(page).not_to have_link('Edit your experience')
  #   end
  # end
  #
  # context 'as a traveler' do
  #   xit 'cannot see an Edit your experience link' do
  #     #create traveler user
  #     expect(page).not_to have_link('Edit your experience')
  #   end
  # end
  #
  # context 'as a guest' do
  #   xit 'cannot see an Edit your experience link' do
  #     #create non-host user
  #     expect(page).not_to have_link('Edit your experience')
  #   end
  # end
end
