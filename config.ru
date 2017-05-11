require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './app/models/message'
require 'slim'
require 'sinatra/twitter-bootstrap'
require 'pry'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }

# map the controllers to routes
map('/') { run SelfDestructionController }
