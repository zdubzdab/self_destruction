class Message < ActiveRecord::Base
  validates :text, presence: true

  before_create :generate_key, :encrypt_text

  private

  def generate_key
    self.key = SecureRandom.hex(5)
  end

  def encrypt_text
    self.text = AESCrypt.encrypt(text, 'password')
  end
end
