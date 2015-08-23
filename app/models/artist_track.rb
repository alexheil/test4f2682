class ArtistTrack < ActiveRecord::Base
  belongs_to :artist
  belongs_to :artist_album

  default_scope -> { order(:track_number) }

  validates :track_number, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 99, greater_than: 0}
  validates :track_name, presence: true

  before_save :artist_name_calculator

  private

    def artist_name_calculator
      self.track_artist = artist.artist_name if track_artist == ""
    end

end
