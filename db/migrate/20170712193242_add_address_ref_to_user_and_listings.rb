class AddAddressRefToUserAndListings < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :address, index: true, foreign_key: true
    add_reference :listings, :address, index: true, foreign_key: true
  end
end
