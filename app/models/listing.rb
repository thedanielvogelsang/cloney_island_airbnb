class Listing < ApplicationRecord
  validates :airbnb_id, presence: true
  has_many :trips
  belongs_to :user, optional: true
end
