class CreateListingAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_amenities do |t|
      t.references :amenity, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
