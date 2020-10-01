feature 'User logging in' do 
	scenario "user can log into the website if the user exists" do 
		UserService.register(name: 'test', email: 'test@test.com', password: '1234567')
		visit '/'
		click_button('Log in')
		expect(page).to have_current_path('/login')
		fill_in('email', with: 'test@test.com')
		fill_in('passsword', with: '1234567')
		click_button('Log in')
		expect(page).to have_current_path('/')
		expect(page).to have_content("Welcome test")
		UserService.log_out
	end 
	
	scenario 'user cannot login if they havent registered' do
		visit '/'
		click_button('Log in')
		expect(page).to have_current_path('/login')
		fill_in('email', with: 'test@test.co.uk')
		fill_in('passsword', with: '12345')
		click_button('Log in')
		expect(page).to have_current_path('/login')
		expect(page).to have_content("This user does not exist")
	end 
end 