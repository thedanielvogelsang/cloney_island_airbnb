class Trip < ApplicationRecord
  belongs_to :user

  enum status: [:requested, :pending, :accepted, :paid]
end
