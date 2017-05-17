require 'spec_helper.rb'
require './app/jobs/destroy_in_one_hour_job.rb'
require './app/models/message.rb'

describe DestroyInOneHourJob do

  describe "perform method" do
    it "delete message" do
      message = Message.create!(text: "John", destroy_one_hour: false)
      expect {
        DestroyInOneHourJob.new.perform(message)
      }.to change(Message, :count).by(-1)
    end
  end
end
