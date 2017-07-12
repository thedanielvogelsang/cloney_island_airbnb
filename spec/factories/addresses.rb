FactoryGirl.define do
  factory :address do
    association :city, factory: :city
    association :state, factory: :state
    association :zip_code, factory: :zip_code

    street_address '123 Fake St.'
    street_address_2 'Unit 22'
  end
end
