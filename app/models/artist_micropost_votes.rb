class ArtistMicropostVotes < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan
  belongs_to :artist_micropost
end
