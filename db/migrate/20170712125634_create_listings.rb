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
      t.integer :property_type
      t.integer :bed_type
      t.integer :pet_type
      t.integer :room_type
      t.references :user, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
