ENV['RACK_ENV'] = 'test'

require 'rubygems'
# require 'steak'
require 'rack/test'
require 'capybara/dsl'

RSpec.configure do |config|
  config.include Capybara::DSL
end

require File.expand_path '../../../app/controllers/self_destruction_controller.rb', __FILE__

Capybara.app = Sinatra::Application
