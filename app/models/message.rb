class Message < ActiveRecord::Base
  validates :text, presence: true

  before_create :generate_key, :encrypt_text
  after_commit :destroy_mes_in_one_hour, on: :create, if: :destroy_one_hour?

  private

  def generate_key
    self.key = SecureRandom.hex(5)
  end

  def encrypt_text
    self.text = AESCrypt.encrypt(text, 'password')
  end

  def destroy_mes_in_one_hour
    DestroyInOneHourJob.perform_in(3600, self)
  end
end
