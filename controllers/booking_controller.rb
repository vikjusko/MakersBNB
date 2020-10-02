require './lib/booking_service'
require './lib/user_service'

class BookingController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions, :method_override  
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
    @booking = BookingService.create(accommodation_id: params[:accommodation_id], user_email: params[:user_email], date: params[:date])
    if @booking == false
      flash[:notice] = "Requested date is unavailable"
      redirect "/booking?accommodation_id=#{params[:accommodation_id]}"
    else
      erb :booking_request
    end
  end

  run! if app_file == $0

end
