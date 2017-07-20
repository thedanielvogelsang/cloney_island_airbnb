require 'rails_helper'

RSpec.describe 'Authorized user can see edit link' do

  before(:example) do
    @exp = create(:experience)
    role = create(:role, name: "host")
    @exp.user.roles << role
  end

  describe 'it visits own experience page' do

    xit 'can see edit link' do

    end

  end

end
# it 'the experience belongs_to the current_user' do
#
#
#
#   host_role = create(:role, name: "host")
#   user = create(:user)
#   user.roles << host_role
#   experiences = create_list(:experience, 4)
#   experience = experiences.first
#   id = experience.id
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
