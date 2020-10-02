require './lib/user_service'
class MakersBNB < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions
  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/' do
    #@user = UserService.current_user
    redirect('/accommodations')
  end

  run! if app_file == $0
end