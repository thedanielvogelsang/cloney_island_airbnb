class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.text :street_address
      t.text :street_address_2
      t.text :city
      t.text :state
      t.text :zip_code

      t.timestamps
    end
  end
end
