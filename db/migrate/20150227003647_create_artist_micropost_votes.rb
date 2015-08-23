class CreateArtistMicropostVotes < ActiveRecord::Migration
  def change
    create_table(:artist_micropost_votes) do |t|
      t.references :artist
      t.references :fan
      t.references :artist_micropost
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0

      t.timestamps
    end

    add_index :artist_micropost_votes, :artist_id
    add_index :artist_micropost_votes, :fan_id
    add_index :artist_micropost_votes, :artist_micropost_id
    add_index :artist_micropost_votes, :upvote
    add_index :artist_micropost_votes, :downvote
  end
end
