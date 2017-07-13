class RemoveImageLinkColumnFromListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :image_link, :string
  end
end
