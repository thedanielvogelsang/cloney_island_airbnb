class Trip < ApplicationRecord
  validates :start_date, :end_date, :num_guests, presence: true
  
  belongs_to :user

  enum status: [:requested, :pending, :accepted, :paid]
end
