class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.text :street_address
      t.text :street_address_2
      t.references :city, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :zip_code, index: true, foreign_key: true

      t.timestamps
    end
  end
end
