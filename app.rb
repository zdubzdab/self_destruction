require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/message'

get '/' do
    "Hello, World!"
end
