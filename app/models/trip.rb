class Trip < ApplicationRecord
  validates :start_date, :end_date, :num_guests, :trip_status, presence: true
  
  belongs_to :user

  enum trip_status: [:requested, :pending, :accepted, :paid]
end
