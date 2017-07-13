require 'rails_helper'

RSpec.describe ListingAmenity, type: :model do
  describe 'relationships' do
    it { should belong_to(:amenity) }
    it { should belong_to(:listing) }
  end
end
