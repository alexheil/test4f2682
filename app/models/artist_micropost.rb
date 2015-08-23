class ArtistMicropost < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan
  has_many :artist_micropost_comments, dependent: :destroy

  default_scope -> { order('id DESC') }

  validates :artist_id, presence: true
  validates :content, presence: true

  before_save :total_votes_calculator

  private

    def total_votes_calculator
      self.total_votes = self.upvotes - self.downvotes
    end

end
