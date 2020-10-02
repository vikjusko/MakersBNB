require './lib/host_service'
require './lib/booking_service'

class HostController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions, :method_override  

  set :public_folder, Proc.new { File.join(root, "../public") }
  
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
    @confirmed = BookingService.confirm_booking(params[:id])
    if @confirmed == false
      flash[:notice] = "Booking date is unavailable"
    else
      flash[:notice] = "Booking is confirmed"
    end
    redirect('/hosting')
  end

end