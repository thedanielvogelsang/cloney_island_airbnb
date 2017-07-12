class Listing < ApplicationRecord
  validates :name, :description, :accomodates, :bathrooms, :bedrooms, :beds, :price, presence: true
  validates :property_type, :bed_type, :room_type, :pet_type, presence: true
  validates :name, uniqueness: true

  belongs_to :cancellation
  belongs_to :user
  belongs_to :address
end
