class ArtistAlbum < ActiveRecord::Base
  belongs_to :artist

  has_many :artist_tracks, dependent: :destroy

  default_scope -> { order('album_year DESC') }
end
