FactoryGirl.define do
  factory :listing_image do
    listing

    property_image { File.new("#{Rails.root}/lib/assets/baby_penguin.jpg") }
  end
end
