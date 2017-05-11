require './app/controllers/application_controller'

class SelfDestructionController < ApplicationController
  get '/' do
    slim :index
  end
end
