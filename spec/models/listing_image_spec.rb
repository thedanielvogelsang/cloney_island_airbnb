require 'rails_helper'

RSpec.describe ListingImage, type: :model do
  describe 'attributes' do

  end

  describe 'relationships' do
    it { should belong_to(:listing) }
  end
end
