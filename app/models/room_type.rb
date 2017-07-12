class RoomType < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :listings
end
