module ApplicationHelpers
  def decrypt_text(text)
    AESCrypt.decrypt(text, 'password')
  end

  def time_fomat(time)
    convert_to_local(time).strftime("%H:%M:%S  %Y-%m-%d")
  end

  def time_of_message_destruction(created_at)
    (convert_to_local(created_at) + 3600).strftime("%H:%M:%S  %Y-%m-%d")
  end

  def time_of_message_existence(now, created_at)
    existance_time = now - created_at
    Time.at(existance_time).utc.strftime("%H:%M:%S")
  end

  def pluralize_if_necessary(word, number)
    if number != 1
      word.pluralize
    else
      word
    end
  end

  private
    def convert_to_local(time)
      time + 7200
    end
end
