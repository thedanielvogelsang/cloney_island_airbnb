require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:phone_number)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}

    it { should allow_value("email@address.com").for(:email) }
    it { should_not allow_value("dude").for(:email) }

    it {should validate_uniqueness_of(:email)}
    it {should validate_uniqueness_of(:phone_number)}
  end

  describe 'relationships' do
    it {should have_many(:user_roles)}
    it {should have_many(:roles).through(:user_roles)}
    it {should have_many(:listings)}
  end

  describe 'password' do
    it {should have_secure_password}
  end

  it 'can create full name' do
    user = create(:user)

    first_name = user.first_name
    last_name = user.last_name
    full_name = user.full_name

    expect(full_name).to eq(first_name + " " + last_name)
  end

end
