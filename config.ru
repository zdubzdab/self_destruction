require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './app/models/message'
require 'slim'
require 'sinatra/twitter-bootstrap'

# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }

# map the controllers to routes
map('/') { run SelfDestructionController }
