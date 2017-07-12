require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:street_address) }
  end

  describe 'relationships' do
    it { should belong_to(:city) }
    it { should belong_to(:state) }
    it { should belong_to(:zip_code) }
  end
end
