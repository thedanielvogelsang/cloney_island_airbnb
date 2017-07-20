require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:num_guests) }
    it { should validate_presence_of(:trip_status) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:listing) }
  end

  describe 'enumerated atttributes' do
    it { should define_enum_for(:trip_status) }
  end
end
