class CreateArtistMicropostComments < ActiveRecord::Migration
  def change
    create_table(:artist_micropost_comments) do |t|
      t.references :artist_micropost
      t.references :artist
      t.references :fan
      t.string :artist_name
      t.string :fan_name
      t.text :content
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.integer :total_votes, default: 0

      t.timestamps
    end

    add_index :artist_micropost_comments, :artist_micropost_id
    add_index :artist_micropost_comments, :artist_id
    add_index :artist_micropost_comments, :fan_id
    add_index :artist_micropost_comments, :artist_name
    add_index :artist_micropost_comments, :fan_name
  end
end
