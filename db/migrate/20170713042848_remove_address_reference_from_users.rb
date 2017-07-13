class RemoveAddressReferenceFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :address, foreign_key: true
  end
end
