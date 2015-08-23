class ArtistProfile < ActiveRecord::Base
  belongs_to :artist

  validates :artist_id, presence: true
  validates :location, presence: true, format: { with: /([^,]+),\s([a-zA-Z])/ }, allow_blank: true
  validates :facebook_url, format: { with: /\A((http|https)?:\/\/)?(www.)?facebook.com\//i  }, allow_blank: true
  validates :twitter_url, format: { with: /\A((http|https)?:\/\/)?(www.)?twitter.com\//i }, allow_blank: true
  validates :youtube_url, format: { with: /\A((http|https)?:\/\/)?(www.)?youtube.com\//i }, allow_blank: true
  validates :itunes_url, format: { with: /\A((http|https)?:\/\/)?(www.)?itunes.com\//i }, allow_blank: true
  validates :amazon_url, format: { with: /\A((http|https)?:\/\/)?(www.)?amazon.com\//i }, allow_blank: true
  validates :google_play_url, format: { with: /\A((http|https)?:\/\/)?(play.)google.com\//i }, allow_blank: true


  before_save :smart_add_url_protocol
  before_save :downcase_url

  protected

    def smart_add_url_protocol
      unless self.facebook_url[/\Ahttp:\/\//] || self.facebook_url[/\Ahttps:\/\//]
        self.facebook_url = "https://#{self.facebook_url}" unless facebook_url == ""
      end
      unless self.twitter_url[/\Ahttp:\/\//] || self.twitter_url[/\Ahttps:\/\//]
        self.twitter_url = "https://#{self.twitter_url}" unless twitter_url == ""
      end
      unless self.youtube_url[/\Ahttp:\/\//] || self.youtube_url[/\Ahttps:\/\//]
        self.youtube_url = "https://#{self.youtube_url}" unless youtube_url == ""
      end
      unless self.itunes_url[/\Ahttp:\/\//] || self.itunes_url[/\Ahttps:\/\//]
        self.itunes_url = "https://#{self.itunes_url}" unless itunes_url == ""
      end
      unless self.amazon_url[/\Ahttp:\/\//] || self.amazon_url[/\Ahttps:\/\//]
        self.amazon_url = "https://#{self.amazon_url}" unless amazon_url == ""
      end
      unless self.google_play_url[/\Ahttp:\/\//] || self.google_play_url[/\Ahttps:\/\//]
        self.google_play_url = "https://#{self.google_play_url}" unless google_play_url == ""
      end
    end

    def downcase_url
      self.facebook_url = facebook_url.downcase
      self.twitter_url = twitter_url.downcase
      self.youtube_url = youtube_url.downcase
      self.itunes_url = itunes_url.downcase
      self.amazon_url = amazon_url.downcase
    end

end
