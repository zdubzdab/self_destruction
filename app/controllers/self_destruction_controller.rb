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
      count_number_of_visits(@message) if @message.destroy_one_hour
      slim :show
  end

  after '/messages/:key' do |key|
    message = Message.find_by_key(key)
    unless message.destroy_one_hour
      destroy_message_after_visit_link(message)
    end
  end

  private

  def destroy_message_after_visit_link(message)
    message.destroy
    # redirect '/', flash[:notice] = "Message with key #{message.key}" +
    #   " was successfully destroyed because it you read it"
  end

  def count_number_of_visits(message)
    message.update_attribute('count_view', message.count_view + 1)
  end
end
