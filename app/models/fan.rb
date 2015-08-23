class Fan < ActiveRecord::Base
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
 #:omniauthable

  has_one :fan_profile, dependent: :destroy

  has_many :relationships, dependent: :destroy
  has_many :artists, through: :relationships
  belongs_to :artist

  has_many :artist_microposts, through: :artists
  has_many :artist_shows, through: :artists

  has_many :artist_micropost_comments, dependent: :destroy
  has_many :artist_merch_purchases, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :fan_name, presence: true, length: { maximum: 50 }

  before_save :downcase_username

  def following?(artist)
    Relationship.exists? fan_id: id, artist_id: artist.id
  end

  def unfollow(artist)
    Relationship.find_by(fan_id: id, artist_id: artist.id).destroy
  end

  private

    def downcase_username
      self.username = username.downcase
    end

end
