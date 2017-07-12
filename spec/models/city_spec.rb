require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:addresses) }
  end
end
