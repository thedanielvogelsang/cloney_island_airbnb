FactoryGirl.define do
  factory :listing do
    association :address, factory: :address
    association :cancellation, factory: :cancellation
    association :user, factory: :user

    name 'Best Place on Earth'
    description 'Place new description here'
    accomodates 3
    bathrooms 3
    bedrooms 2
    beds 6
    price 25.99
    house_rules 'No smoking'
    property_type 'Apartment'
    bed_type 'King'
    pet_type 'Dog(s) And Cat(s)'
    room_type 'Entire Apt/Home'
  end
end
