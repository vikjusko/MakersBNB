require 'sinatra/base'
require 'pg'
require_relative './lib/database_connection'
require './database_connection_setup'

class MakersBNB < Sinatra::Base

	get '/' do 
		erb :index
	end 

	get '/accommodation' do
		'Nice cottage in Deptford'
	end 

	get '/booking' do 
		erb :booking
	end 

	
	run if app_file == $0

end 



