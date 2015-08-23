class FanProfile < ActiveRecord::Base
  belongs_to :fan

  validates :fan_id, presence: true
  validates :location, presence: true, format: { with: /([^,]+),\s([a-zA-Z])/ }, allow_blank: true

end
