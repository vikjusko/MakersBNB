# require './lib/user_service'

class UserController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions

  get '/sign-up' do
    erb :sign_up
  end

  post '/users/new' do
    # UserService.register(email: params[:email], name: params[:name], password: params[:password])
    redirect '/'
  end

  # post '/login' do
  #   flash[:notice] = "Invalid credentials" unless UserService.login(params[:username], params[:password])
  #   redirect '/'
  # end
  #
  # post '/logout' do
  #   UserService.logout
  #   redirect '/'
  # end

  run! if app_file == $0

end
