class CreateArtistTracks < ActiveRecord::Migration
  def change
    create_table(:artist_tracks) do |t|
      t.references :artist
      t.references :artist_album
      t.integer :track_number
      t.string :track_name
      t.string :track_artist
      t.string :track_url
      t.text :track_lyrics

      t.timestamps
    end

    add_index :artist_tracks, :artist_id
    add_index :artist_tracks, :artist_album_id
    add_index :artist_tracks, :track_number
  end
end
