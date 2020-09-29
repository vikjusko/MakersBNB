
class AccommodationController < Sinatra::Base

  get '/accommodations' do
    'Nice cottage in Deptford'
  end

  run! if app_file == $0

end