class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :auth_token, :password, :password_confirmation, :email
  attr_accessible :password_digest
  has_many :locations, as: :locatable, dependent: :destroy

  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  before_create { generate_token(:auth_token) }
  # before_create { generate_token(:verification_token) }
  before_save { |user| user.email = email.downcase }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def verify!
    self.verified = true
    self.save!
  end

  def verified?
    self.verified?
  end

  def deliver_verification_instructions(user)
    UserMailer.account_verification_instructions(self).deliver
  end
end
