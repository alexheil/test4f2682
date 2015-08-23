class ArtistMerchPurchase < ActiveRecord::Base
  belongs_to :artist_merch
  belongs_to :artist
  belongs_to :fan

  default_scope -> { order('id DESC') }

  validates :quantity, presence: true, numericality: {greater_than: 0}

  before_save :complete_price_calculator

  private

    def complete_price_calculator
      self.complete_price = (artist_merch.total_price * quantity) + pay_your_own_price
    end

end
