require './lib/host_service'
#require './lib/user_service'

class HostController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)
  
  enable :sessions
  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/hosting' do
    erb :hosting
    
  end

end