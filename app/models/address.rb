class Address < ApplicationRecord
  validates :street_address, presence: true

  belongs_to :city
  belongs_to :state
  belongs_to :zip_code
end
