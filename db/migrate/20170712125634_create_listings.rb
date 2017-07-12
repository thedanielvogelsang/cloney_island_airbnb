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
      t.text :property_type
      t.text :bed_type
      t.text :pet_type
      t.text :room_type
      t.references :user, index: true, foreign_key: true
      t.references :cancellation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
