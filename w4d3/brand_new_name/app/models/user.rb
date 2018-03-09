class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: 'password cant be blank'}
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    User.find_by(username: username, password: password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)

  end

  # This method sets @password equal to the argument given so that the appropriate validation can happen
  # This method also encrypts the argument given and saves it as this user's password_digest
  # Remember: you have to add an attr_reader for password for the validation to occur!
end
