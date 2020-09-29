
class MakersBNB < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  get '/' do
    erb :index
  end

  run! if app_file == $0
end