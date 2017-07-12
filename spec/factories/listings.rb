FactoryGirl.define do
  factory :listing do
    association :address, factory: :address
    association :cancellation, factory: :cancellation
    association :user, factory: :user

    image_link 'https://a0.muscache.com/im/pictures/21162888/5a0f1151_original.jpg?aki_policy=xx_large'
    name 'Best Place on Earth'
    description 'Place new description here'
    accomodates 3
    bathrooms 3
    bedrooms 2
    beds 6
    price 25.99
    house_rules 'No smoking'
    property_type 'apartment'
    bed_type 'king'
    pet_type 'cat_and_dog'
    room_type 'entire_home'
  end
end
