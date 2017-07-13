class Address < ApplicationRecord
  validates :street_address, :city, :state, :zip_code, presence: true

  belongs_to :user
  belongs_to :listing
end
