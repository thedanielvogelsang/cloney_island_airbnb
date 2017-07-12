class City < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many(:addresses)
end
