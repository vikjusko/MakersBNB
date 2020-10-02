require './lib/booking_service'
require './lib/user_service'

class BookingController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions, :method_override  
  set :public_folder, Proc.new { File.join(root, "../public") }
  

  register Sinatra::Flash


  before do
    @user = UserService.current_user
  end

  def layout
    { :layout => :layout }
  end

  get '/layout-test' do
    erb :booking, layout
  end

  get '/booking' do
    @accommodation_id = params[:accommodation_id]
    erb :booking
  end

  post '/booking/new' do
    BookingService.create(accommodation_id: params[:accommodation_id], user_email: params[:user_email], date: params[:date])
    erb :booking_request
  end

  run! if app_file == $0

end
