require 'sinatra/base'
require 'pg'

Class MakersBNB < Sinatra::Base

	get '/' do 
		"Welcome to MakersBNB"
	end 


	run if app_file == $0

end 