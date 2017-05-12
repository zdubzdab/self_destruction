require './app/controllers/application_controller'

class SelfDestructionController < ApplicationController
  get '/' do
    @messages = Message.all
    slim :index
  end

  post '/submit' do
    @message = Message.new(params[:message])
    if @message.save
      redirect '/', flash[:notice] = "Message was successfully created"
    else
      redirect :new, flash[:error] = "Text of message can't be blank"
    end
  end

  get '/new' do
    slim :new
  end

  get '/messages/:key' do
    @message = Message.find_by_key(params[:key])
    slim :show
  end
end
