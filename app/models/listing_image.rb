class ListingImage < ApplicationRecord
  has_attached_file :property_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :property_image, content_type: /^image\/(png|jpeg|jpg)/

  belongs_to :listing

  validates :property_image, presence: true
end
