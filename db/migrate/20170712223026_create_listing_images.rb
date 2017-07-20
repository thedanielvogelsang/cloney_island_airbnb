class CreateListingImages < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_images do |t|
      t.references :listing, index: true, foreign_key: true

      t.timestamps
    end
  end
end
