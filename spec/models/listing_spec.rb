require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:accomodates) }
    it { should validate_presence_of(:bathrooms) }
    it { should validate_presence_of(:bedrooms) }
    it { should validate_presence_of(:beds) }
    it { should validate_presence_of(:price) }

    it { should validate_uniqueness_of(:name) }
  end

  describe 'relationships' do
    it { should belong_to(:property_type) }
    it { should belong_to(:bed_type) }
    it { should belong_to(:room_type) }
    it { should belong_to(:pet_type) }
    it { should belong_to(:cancellation) }
    it { should belong_to(:user) }
    it { should belong_to(:address) }
  end
end
