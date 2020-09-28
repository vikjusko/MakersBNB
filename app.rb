require 'sinatra/base'
require 'pg'


class MakersBNB < Sinatra::Base

	get '/' do 
		"Welcome to MakersBNB"
	end 


	run if app_file == $0

end 

require 'sinatra/base'
require 'pg'


class MakersBNB < Sinatra::Base

	get '/' do 
		"Welcome to MakersBNB"
	end 


	run if app_file == $0

end 


feature 'View accomodation' do
  scenario 'A list accmmodation is viewed on sceen' do
    visit '/'
    click_button("View accommodation")
    expect(current_path).to eq("/accommodation")
    expect(page).to have_content("Nice cottage in Depford")
  end
end

