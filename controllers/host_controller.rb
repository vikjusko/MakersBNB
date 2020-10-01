require './lib/host_service'
#require './lib/user_service'

class HostController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions
  register Sinatra::Flash

  get '/hosting' do
    "You aren't hosting any properties yet."
  end

end