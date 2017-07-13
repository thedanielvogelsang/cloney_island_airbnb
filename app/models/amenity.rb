class Amenity < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :listing_amenities
  has_many :listings, through: :listing_amenities
end
