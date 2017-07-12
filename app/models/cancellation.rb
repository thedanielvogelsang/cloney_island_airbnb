class Cancellation < ApplicationRecord
  validates :name, :refund, :description, presence: true
  validates :name, uniqueness: true

  has_many :listings
end
