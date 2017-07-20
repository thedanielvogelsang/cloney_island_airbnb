require 'rails_helper'
require_relative 'experience_helper'

RSpec.describe 'Authorized user can see edit link' do
  include ExperienceHelper

  before(:example) do
    @exp = create_experience
  end

  describe 'it visits own experience page' do

    it 'can see edit link' do
      
    end

  end

end

#   experiences.each do |e|
#     e.experience_images.create!(image: File.new("#{Rails.root}/lib/assets/baby_penguin.jpg"))
#   end
#
#   within('.host-edit-link') do
#     expect(page).to have_link('Edit Your Experience')
#     click_on "Edit Your Experience"
#   end
#
#   expect(path).to eq(edit_experience_path(experience.id))
#
# end
#
# context 'the experience does not belong to the host' do
#   it 'cannot see an Edit your experience link' do
#     expect(page).not_to have_link('Edit your experience')
#   end
# end
#
# context 'as a traveler' do
#   it 'cannot see an Edit your experience link' do
#     #create traveler user
#     expect(page).not_to have_link('Edit Your Experience')
#   end
# end
#
# context 'as a guest' do
#   it 'cannot see an Edit your experience link' do
#     #create non-host user
#     expect(page).not_to have_link('Edit your experience')
#   end
# end
