require 'rails_helper'

RSpec.describe Cancellation, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:refund) }
    it { should validate_presence_of(:description) }

    it { should validate_uniqueness_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:listings) }
  end
end
