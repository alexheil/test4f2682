class ArtistMerch < ActiveRecord::Base
  belongs_to :artist
  has_many :artist_merch_purchases

  validates :paypal_email, presence: true, allow_blank: true
  validates :merch_name, presence: true
  validates :base_price, presence: true
  validates :shipping_price, presence: true
  validates :quantity, presence: true
  validates :return_policy, presence: true
  validates :shipping_info, presence: true

  before_save :total_price_calculator
  before_save :paypal_email_calculator

  private

    def total_price_calculator
      self.total_price = base_price + shipping_price
    end

    def paypal_email_calculator
      self.paypal_email = artist.email if paypal_email == ""
    end

end
