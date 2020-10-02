require './lib/user_service'
class MakersBNB < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
<<<<<<< HEAD

  enable :sessions, :method_override  
  set :public_folder, File.expand_path('../../public', __FILE__)

=======
  set :public_folder, Proc.new { File.join(root, "../public") }
  
  enable :sessions
>>>>>>> c0a0dae08564cf8d1e8a1999a09640d497f7f9f1
  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/' do
    redirect('/accommodations')
  end

  run! if app_file == $0
end
