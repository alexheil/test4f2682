class AddItemsToArtistProfile < ActiveRecord::Migration
  def change
    add_column :artist_profiles, :google_play_url, :string, default: ""
    add_column :artist_profiles, :record_label, :string, default: ""
    add_column :artist_profiles, :cover_image, :string, default: ""
    add_column :artist_profiles, :profile_image, :string, default: ""
  end
end
