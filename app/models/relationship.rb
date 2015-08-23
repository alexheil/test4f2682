class Relationship < ActiveRecord::Base
  belongs_to :fan
  belongs_to :artist

  validates :fan_id, presence: true
  validates :artist_id, presence: true

end
