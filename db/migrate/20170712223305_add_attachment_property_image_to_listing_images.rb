class AddAttachmentPropertyImageToListingImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :listing_images do |t|
      t.attachment :property_image
    end
  end

  def self.down
    remove_attachment :listing_images, :property_image
  end
end
