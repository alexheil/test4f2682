class ArtistMicropostComment < ActiveRecord::Base
  belongs_to :artist_micropost
  belongs_to :artist
  belongs_to :fan

  validates :content, presence: true

  default_scope -> { order('total_votes DESC') }

end
