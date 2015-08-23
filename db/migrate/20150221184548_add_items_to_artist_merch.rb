class AddItemsToArtistMerch < ActiveRecord::Migration
  def change
    add_column :artist_merches, :merch_image, :string, default: ""
  end
end
