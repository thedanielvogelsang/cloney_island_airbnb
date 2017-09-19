class Listing < ApplicationRecord
  validates :airbnb_id
  has_many :trips
end
