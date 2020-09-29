require 'sinatra/base'
require 'pg'
require 'database_connection'

class MakersBNB < Sinatra::Base

	get '/' do 
		erb :index
	end 

	get '/accommodation' do
		'Nice cottage in Deptford'
	end 

	
	run if app_file == $0

end 



