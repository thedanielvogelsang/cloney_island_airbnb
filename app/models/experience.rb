class Experience < ApplicationRecord
  belongs_to :user
  has_many :experience_images
end
