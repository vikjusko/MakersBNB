require './lib/accommodation_service'


class AccommodationController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)


  get '/accommodations' do

    @accommodation_list = AccommodationService.all
    erb :accommodations
  end

  post 'accommodations/id' do
     "Hello World"
  end

  run! if app_file == $0

end