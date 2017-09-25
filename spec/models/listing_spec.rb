require 'rails_helper'

RSpec.describe Listing, type: :model do

  describe 'relationships' do
    it { should belong_to(:user) }

    it { should have_many(:listing_images) }
    it { should have_many(:listing_amenities) }
    it { should have_many(:amenities) }
    it { should have_many(:trips) }
  end

  describe 'enumerated attributes' do
    it { should define_enum_for(:property_type) }
    it { should define_enum_for(:bed_type) }
    it { should define_enum_for(:room_type) }
    it { should define_enum_for(:pet_type) }
    it { should define_enum_for(:status) }
    it { should define_enum_for(:cancellation_policy) }
  end
end
