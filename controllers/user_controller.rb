# require './lib/user_service'
require 'sinatra/flash'
class UserController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, Proc.new { File.join(root, "../public") }

  enable :sessions
  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/users/new' do
    if UserService.register(email: params[:email], name: params[:name], password: params[:password]) 
      flash[:notice] = "Thank you for signing up."
      redirect '/'
    else ## TODO currently broken. Returns an error page.
      flash[:notice] = "These details are already in use, try signing in instead."
      redirect '/sign-up'
    end
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
      flash[:notice] = "You have been logged in." #TODO: update to include name. @user.name not working. Undefined class @user.
      redirect '/'
    else  
      flash[:notice] = "Invalid credentials"
      redirect '/login'
    end
  end

  run! if app_file == $0

end
