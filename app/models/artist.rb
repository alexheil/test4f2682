class Artist < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
  #:omniauthable

  has_one :artist_profile, dependent: :destroy

  has_many :relationships, dependent: :destroy
  has_many :fans, through: :relationships
  belongs_to :fan

  has_many :artist_albums, dependent: :destroy
  has_many :artist_tracks, through: :artist_albums, dependent: :destroy
  has_many :artist_videos, dependent: :destroy
  has_many :artist_shows, dependent: :destroy
  has_many :artist_merches, dependent: :destroy
  has_many :artist_microposts, dependent: :destroy
  has_many :artist_micropost_comments, through: :artist_microposts, dependent: :destroy
  has_many :artist_merch_purchases, through: :artist_merches, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :artist_name, presence: true, length: { maximum: 50 }

  before_save :downcase_username

  private

    def downcase_username
      self.username = username.downcase
    end

end
