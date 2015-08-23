class CreateArtistVideos < ActiveRecord::Migration
  def change
    create_table(:artist_videos) do |t|
      t.references :artist
      t.string :video_title
      t.text :video_description
      t.string :youtube_video_url

      t.timestamps
    end

    add_index :artist_videos, :artist_id
  end
end
