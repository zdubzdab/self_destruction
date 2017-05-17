require 'spec_helper'
# require File.expand_path '../../acceptance/acceptance_helper.rb', __FILE__
# Capybara.app = Sinatra::Application
# feature "Creation city" do

#   context "by guest" do

#     scenario 'unsuccessful' do
#       visit "/"

#       expect(page).to have_content('Self-destruction')
#       # expect(current_path).to eq("/sessions/new")
#     end
#   end

# end


# ENV['RACK_ENV'] = 'test'
# require "rack/test"
# require './app/controllers/self_destruction_controller.rb'
# require 'capybara'
# require 'capybara/dsl'
# require 'test/unit'

# class MessageCreateion < Test::Unit::TestCase
#   include Capybara::DSL
#   # Capybara.default_driver = :selenium # <-- use Selenium driver

#   def setup
#     Capybara.app = Sinatra::Application.new
#   end

#   def test_it_works
#     visit '/'
#     assert page.has_content?('Self-destruction')
#   end
# end






require 'spec_helper.rb'
require './app/controllers/self_destruction_controller.rb'
require 'rack/test'

describe SelfDestructionController do
  include Rack::Test::Methods

  # def app
  #   SinatraApp.new
  # end
# end

# describe SelfDestructionController do
  # include ApplicationHelpers

  describe "decrypt_text method" do
    it "displays home page" do 
      get '/new'

      expect(last_response.body).to include("Hello world!")
    end
  end
end
