require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:num_guests) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end
end
