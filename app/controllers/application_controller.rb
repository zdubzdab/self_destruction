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
