module ApplicationHelpers
  def decrypt_text(text)
    AESCrypt.decrypt(text, 'password')
  end
end
