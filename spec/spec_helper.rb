require 'rack/test'
require 'sinatra'
require 'sinatra/activerecord'
require 'shoulda/matchers'
require 'aescrypt'
require 'pry'
require 'sucker_punch/testing/inline'
require 'slim'
# require 'capybara/rspec'

include Rack::Test::Methods

def app
  Sinatra::Application 
end

RSpec.configure do |config|

  # config.include Capybara::DSL, feature: true
  # config.include Capybara::RSpecMatchers, feature: true

  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
