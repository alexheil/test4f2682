class CreateArtistShows < ActiveRecord::Migration
  def change
    create_table(:artist_shows) do |t|
      t.references :artist
      t.integer :show_month
      t.integer :show_day
      t.integer :show_year
      t.string :show_location
      t.string :show_venue
      t.string :show_ticket_url

      t.timestamps
    end

    add_index :artist_shows, :artist_id
  end
end
