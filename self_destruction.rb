require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/message'
require 'slim'
require 'sinatra/twitter-bootstrap'

class SelfDestruction < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    slim :index
  end
end
