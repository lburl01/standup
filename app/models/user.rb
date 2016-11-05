class User < ApplicationRecord
  validates :name, :email, presence: true

  has_many :bulbs
  has_many :comments

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.id).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  # def self.bulbs_per_user
  #   @users_bulbs = Bulb.select("bright, dim, blocked, likes, panic_score, created_at").where(user_id: @current_user.id).where("is_deleted = false").all
  # end
end
