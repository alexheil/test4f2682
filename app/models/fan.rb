class Fan < ActiveRecord::Base
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
 #:omniauthable
  before_save :downcase_username
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :fan_name, presence: true, length: { maximum: 50 }

  private

    def downcase_username
      self.username = username.downcase
    end

end
