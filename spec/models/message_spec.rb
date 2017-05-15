require 'spec_helper.rb'
require './app/models/message.rb'
require 'aescrypt'

RSpec.describe Message, type: :model do

  it { should validate_presence_of(:text) }

  it "triggers method generate_key on create" do
    message = Message.new(text: "John", destroy_one_hour: false)

    expect(message).to receive(:generate_key)
    message.save
  end

  it "triggers method encrypt_text on create" do
    message = Message.new(text: "John", destroy_one_hour: false)

    expect(message).to receive(:encrypt_text)
    message.save
  end

  it "generate_key on create" do
    message = Message.new(text: "John", destroy_one_hour: false)
    message.save

    expect(message.key).to be_truthy
    expect(message.key.length).to eq(10)
  end

  it "encrypt text on create" do
    message = Message.new(text: "John", destroy_one_hour: false)
    message.save

    decrypted_text = AESCrypt.decrypt(message.text, 'password')

    expect(decrypted_text).to eq("John")
  end

  it "triggers destroy_mes_in_one_hour on create" do
    message = Message.new(text: "John", destroy_one_hour: true)

    expect(message).to receive(:destroy_mes_in_one_hour)
    message.save
  end

  it "doesn't triggers destroy_mes_in_one_hour on create" do
    message = Message.new(text: "John", destroy_one_hour: false)

    expect(message).not_to receive(:destroy_mes_in_one_hour)
    message.save
  end
end
