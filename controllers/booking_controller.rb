class BookingController < Sinatra::Base

  get '/bookings' do
    erb :booking
  end

  run! if app_file == $0

end