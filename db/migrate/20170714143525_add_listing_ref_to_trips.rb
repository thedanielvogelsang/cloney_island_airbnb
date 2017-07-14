class AddListingRefToTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :listing, foreign_key: true
  end
end
