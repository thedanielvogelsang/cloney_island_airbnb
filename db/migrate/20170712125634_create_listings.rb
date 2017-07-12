class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.text :name
      t.text :description
      t.integer :accomodates
      t.integer :bathrooms
      t.integer :bedrooms
      t.integer :beds
      t.float :price
      t.text :house_rules
      t.references :property_type, index: true, foreign_key: true
      t.references :bed_type, index: true, foreign_key: true
      t.references :pet_type, index: true, foreign_key: true
      t.references :room_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :cancellation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
