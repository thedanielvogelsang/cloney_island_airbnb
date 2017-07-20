require 'rails_helper'

RSpec.describe ListingImage, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:property_image) }

    it { should have_attached_file(:property_image) }
    it { should validate_attachment_content_type(:property_image).
                allowing('image/png', 'image/jpeg', 'image/jpg').
                rejecting('text/plain', 'text/xml', 'image/gif') }
  end

  describe 'relationships' do
    it { should belong_to(:listing) }
  end
end
