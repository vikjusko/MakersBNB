require './lib/host_service'
#require './lib/user_service'

class HostController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions
  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/hosting' do
    @listing = HostService.all(@user.id)
    @requests = HostService.find_pending_requests(@user.id)
    erb :hosting
  end

  get '/hosting/requests' do
    "placeholder text"
  end

end