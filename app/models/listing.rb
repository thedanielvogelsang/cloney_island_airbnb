class Listing < ApplicationRecord
  validates :airbnb_id, presence: true
  has_many :trips
end
