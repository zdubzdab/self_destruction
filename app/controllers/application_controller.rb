require 'sinatra'
require 'sinatra/activerecord'
require 'slim'
require 'sinatra/twitter-bootstrap'
require 'pry'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require 'aescrypt'
require 'sucker_punch'
require 'active_support/inflector'

require './config/environments'
require './app/models/message'
require './app/helpers/application_helpers'
require './app/jobs/destroy_in_one_hour_job'

class ApplicationController < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets
  helpers ApplicationHelpers
  enable :sessions
  register Sinatra::Flash

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end
end
