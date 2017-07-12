require 'rails_helper'

RSpec.describe ZipCode, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:zip) }
    it { should validate_uniqueness_of(:zip) }
  end

  describe 'relationships' do
    it { should have_many(:addresses) }
  end
end
