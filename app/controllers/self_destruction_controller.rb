require './app/controllers/application_controller'

class SelfDestructionController < ApplicationController
  get '/' do
    @messages = Message.all
    slim :index
  end

  post '/submit' do
    @message = Message.new(params[:message])
    if @message.save
      redirect '/messages'
    else
      "Sorry, there was an error!"
    end
  end

  get '/new' do
    slim :new
  end
end
