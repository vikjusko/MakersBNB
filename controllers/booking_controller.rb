require './lib/booking_service'

class BookingController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions

  get '/layout-test' do
    erb :booking, :layout => :layout
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
