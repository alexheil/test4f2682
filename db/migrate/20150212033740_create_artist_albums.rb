class CreateArtistAlbums < ActiveRecord::Migration
  def change
    create_table(:artist_albums) do |t|
      t.references :artist
      t.string :album_name
      t.integer :album_year
      t.string :album_cover_art_url

      t.timestamps
    end

    add_index :artist_albums, :artist_id
  end
end
