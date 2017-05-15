require 'spec_helper.rb'
require './app/jobs/destroy_in_one_hour_job.rb'

describe ApplicationHelpers do
  include ApplicationHelpers

  describe "decrypt_text method" do
    it "decrypted text should equal typed text" do
      encrypted_text = AESCrypt.encrypt('text', 'password')

      expect(decrypt_text(encrypted_text)).to eq('text')
    end
  end
end
