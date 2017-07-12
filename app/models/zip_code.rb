class ZipCode < ApplicationRecord
  validates :zip, presence: true
  validates :zip, uniqueness: true

  has_many :addresses
end
