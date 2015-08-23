class CreateArtistMicroposts < ActiveRecord::Migration
  def change
    create_table(:artist_microposts) do |t|
      t.references :artist
      t.text :content
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.integer :total_votes, default: 0

      t.timestamps
    end

    add_index :artist_microposts, :artist_id
  end
end
