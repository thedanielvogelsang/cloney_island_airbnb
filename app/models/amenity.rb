class Amenity < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :listing_amenities
  has_many :listings, through: :listing_amenities

  def self.list_amenities(amenities)
    listing_amenities = []
    amenities.each do |key,value|
      listing_amenities << Amenity.find_by(name: key) if value != "0"
    end
    listing_amenities
  end


end
