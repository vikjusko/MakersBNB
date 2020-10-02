require './lib/host_service'
require './lib/booking_service'

class HostController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions, :method_override  
  set :public_folder, File.expand_path('../../public', __FILE__)
  
  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/hosting' do
    @listing = HostService.all(@user.id)
    @requests = HostService.find_pending_requests(@user.id)
    erb :hosting
  end

  post '/hosting/request/:id' do
    BookingService.confirm_booking(params[:id])
    flash[:notice] = "Booking is confirmed"
    redirect('/hosting')
  end

end