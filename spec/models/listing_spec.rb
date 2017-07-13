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
    it { should validate_presence_of(:property_type) }
    it { should validate_presence_of(:bed_type) }
    it { should validate_presence_of(:room_type) }
    it { should validate_presence_of(:pet_type) }
    it { should validate_presence_of(:status) }

    it { should validate_uniqueness_of(:name) }
  end

  describe 'relationships' do
    it { should belong_to(:cancellation) }
    it { should belong_to(:user) }
    it { should belong_to(:address) }

    it { should have_many(:listing_images) }
    it { should have_many(:listing_amenities) }
    it { should have_many(:amenities) }
  end
end
