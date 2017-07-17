class Trip < ApplicationRecord
  validates :start_date, :end_date, :num_guests,  presence: true
  # validates :trip_status, presence: true

  belongs_to :user
  belongs_to :listing

  enum trip_status: [:requested, :pending, :accepted, :paid]
end
