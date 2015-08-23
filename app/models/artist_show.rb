class ArtistShow < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan

  default_scope -> { order(:show_year, :show_month, :show_day) }

  validates :artist_id, presence: true
  validates :show_month, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 12, greater_than: 0}
  validates :show_day, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 31, greater_than: 0 }
  validates :show_year, presence: true, length: { is: 4 }, numericality: { less_than_or_equal_to: 2016, greater_than: 2014}
  validates :show_location, presence: true, format: { with: /([^,]+),\s([a-zA-Z])/ }
  validates :show_ticket_url, format: { with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix }

  before_save :smart_add_url_protocol
  before_save :feburary_time
  before_save :ticketfly_affiliate_link

  private

    def feburary_time
      if self.show_month == 2
        self.show_day <= 28
      end
    end

    def ticketfly_affiliate_link
      self.show_ticket_url = "#{self.show_ticket_url}" + "heyoimanaffiliatelink" if self.show_ticket_url[ /\A((http|https)?:\/\/)?(www.)?ticketfly.com\//i ]
    end

    def smart_add_url_protocol
      unless self.show_ticket_url[/\Ahttp:\/\//] || self.show_ticket_url[/\Ahttps:\/\//]
        self.show_ticket_url = "https://#{self.show_ticket_url}" unless self.show_ticket_url == ""
      end
    end

end
