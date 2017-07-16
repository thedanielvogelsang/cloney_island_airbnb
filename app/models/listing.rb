class Listing < ApplicationRecord
  validates :name, :description, :accomodates, :bathrooms, :bedrooms, :beds, :price, presence: true
  validates :property_type, :bed_type, :room_type, :pet_type, :status, :cancellation_policy, presence: true
  validates :address, presence: true
  validates :name, uniqueness: true

  belongs_to :user

  has_many :listing_images, dependent: :destroy
  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities
  has_many :trips

  enum property_type: [:house, :apartment, :guesthouse, :boat, :treehouse]
  enum room_type: [:entire_home, :private_room, :shared_room]
  enum bed_type: [:king, :queen, :double, :twin, :single, :couch]
  enum pet_type: [:no_pets, :cat, :dog, :cat_and_dog, :misc]
  enum status: [:unlisted, :listed]
  enum cancellation_policy: [:flexible, :moderate, :strict]

  accepts_nested_attributes_for :listing_images, :reject_if => lambda { |t| t['listing_image'].nil? }

  def self.search_city(params)
    city = params[:search_city].downcase
    state = params[:search_state].downcase
    joins(:address).where("LOWER(addresses.city) LIKE ? AND LOWER(addresses.state) LIKE ?", city, state)
  end
  
  def self.search_zip(params)
    joins(:address).where("addresses.zip_code LIKE ?", params[:search_zip])
  end
end
