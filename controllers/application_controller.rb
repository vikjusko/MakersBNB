require './lib/user_service'
class MakersBNB < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = UserService.current_user
    erb :index
  end

  run! if app_file == $0
end