class Listing < ApplicationRecord
  validates :name, :description, :accomodates, :bathrooms, :bedrooms, :beds, :price, presence: true

  validates :name, uniqueness: true

  belongs_to :property_type
  belongs_to :bed_type
  belongs_to :room_type
  belongs_to :pet_type
  belongs_to :cancellation
  belongs_to :user
  belongs_to :address
end
