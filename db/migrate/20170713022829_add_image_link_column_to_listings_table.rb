class AddImageLinkColumnToListingsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :image_link, :string
  end
end
