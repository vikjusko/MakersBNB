require './lib/accommodation_service'

class AccommodationController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions

  get '/accommodations' do
    @accommodation_list = AccommodationService.all
    erb :accommodations
  end

  get '/accommodations/:id' do
    @accommodation = AccommodationService.find(params[:id])
    session[:accommodation_id] = @accommodation.id
    erb :accommodation_details
  end

  run! if app_file == $0

end