class BookingController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  get '/booking' do
    erb :booking
  end

  post '/booking/new' do
    accommodation_id = @accommodation_id #this will be passed in from the accommodation_controller

    BookingService.create(accommodation_id: accommodation_id, user_email: params[:user_email], date: params[:date])

    erb :booking_request
  end

  run! if app_file == $0

end
