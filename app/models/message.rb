class Message < ActiveRecord::Base
  validates :text, presence: true
  validates :key, presence: true

  before_create :generate_key

  private

  def generate_key
    self.key = SecureRandom.hex(5)
  end

end
