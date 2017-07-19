class Experience < ApplicationRecord
  belongs_to :user
  has_many :experience_images
  has_many :exp_experience_categories
  has_many :experience_categories, through: :exp_experience_categories
end
