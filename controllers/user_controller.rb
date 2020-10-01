# require './lib/user_service'
require 'sinatra/flash'
class UserController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions
  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/users/new' do
    UserService.register(email: params[:email], name: params[:name], password: params[:password])
    redirect '/'
  end

  get '/login' do 
    erb :login
  end 
   
  get '/log-out' do
    UserService.logout
    flash[:notice] = "You have signed out."
    redirect '/'
  end

  post '/login' do
    if UserService.login(email: params[:email], password: params[:password])
      redirect '/'
    else  
      flash[:notice] = "Invalid credentials" 
      redirect '/login'
    end
  end
  
  

  run! if app_file == $0

end
