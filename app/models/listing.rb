class Listing < ApplicationRecord
  validates :name, :description, :accomodates, :bathrooms, :bedrooms, :beds, :price, presence: true

  validates :name, uniqueness: true

  belongs_to :property_type
  belongs_to :bed_type
  belongs_to :room_type
  belongs_to :pet_type
  belongs_to :cancellation
  belongs_to :user

  enum property_type: [:house, :apartment, :guesthouse, :boat, :treehouse]
  enum room_type: [:entire_home, :private_room, :shared_room]
  enum bed_type: [:king, :queen, :double, :twin, :single, :couch]
  enum pet_type: [:no_pets, :cat, :dog, :cat_and_dog, :misc]
end
