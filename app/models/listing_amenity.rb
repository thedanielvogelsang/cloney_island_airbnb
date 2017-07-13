class ListingAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :listing
end
