class User < ApplicationRecord
  attr_accessor :reset_token

    has_secure_password
    has_many :questions
    has_many :messages, dependent: :destroy
    has_many :chats, through: :messages


  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true

  def create_reset_digest
    self.reset_token = SecureRandom.urlsafe_base64
    update_columns(reset_digest: Digest::SHA1.hexdigest(reset_token), reset_sent_at: Time.zone.now)
  end

  def password_reset_expired?
    reset_sent_at < 1.hours.ago
  end

  def password_reset_token_valid?(token)
    # reset_digest = Digest::SHA1.hexdigest(reset_token.to_s)
    reset_digest == token && !password_reset_expired?
  end

  def reset_password(new_password)
    update(password: new_password, reset_sent_at: nil, reset_digest: nil)
  end

end
