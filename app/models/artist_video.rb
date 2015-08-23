class ArtistVideo < ActiveRecord::Base
  belongs_to :artist

  default_scope -> { order('id DESC') }

  validates :artist_id, presence: true
  validates :video_title, presence: true
  validates :youtube_video_url, presence: true, format: { with: /\A((http|https)?:\/\/)?(www.)?youtube.com\//i }
  validates :video_description, length: { maximum: 500 }

end
