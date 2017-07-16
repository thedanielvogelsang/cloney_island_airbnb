FactoryGirl.define do
  factory :amenity do
    sequence(:name) do  |i|
      "Amenity #{i}"
    end
  end
end
