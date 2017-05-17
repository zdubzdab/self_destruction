require 'spec_helper.rb'
require './app/helpers/application_helpers.rb'

describe ApplicationHelpers do
  include ApplicationHelpers

  describe "decrypt_text method" do
    it "decrypted text should equal typed text" do
      encrypted_text = AESCrypt.encrypt('text', 'password')

      expect(decrypt_text(encrypted_text)).to eq('text')
    end
  end

  describe "time_fomat method" do
    it "change time format" do
      time = Time.parse('2017-05-17 07:18:06 UTC')

      expect(time_fomat(time)).to eq('09:18:06  2017-05-17')
    end
  end

  describe "time_of_message_destruction method" do
    it "count time of message destruction" do
      time = Time.parse('2017-05-17 07:18:06 UTC')

      expect(time_of_message_destruction(time)).to eq('10:18:06  2017-05-17')
    end
  end

  describe "time_of_message_existence method" do
    it "count time of message existence" do
      created_at = Time.parse('2017-05-17 07:18:06 UTC')
      now = Time.parse('2017-05-17 08:19:07 UTC')

      expect(time_of_message_existence(now, created_at)).to eq('01:01:01')
    end
  end

  describe "pluralize_if_necessary method" do
    it "pluralize word if it is necessary" do
      word = "person"
 
      expect(pluralize_if_necessary(word, 1)).to eq('person')
      expect(pluralize_if_necessary(word, 21)).to eq('people')
      expect(pluralize_if_necessary(word, 100)).to eq('people')
    end
  end
end
