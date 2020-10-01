feature '#logging out' do
	scenario "if the user is logged in/signed up they can log out" do
		visit "/"
		click_button "Sign up"
		expect(page).to have_current_path("/sign-up")
		fill_in "email", with: "123@email.com"
		fill_in "name", with: "Test User"
		fill_in "password", with: "h3ll0wor!d"
		click_button "Sign up"
		click_button 'Log out'
		expect(page).not_to have_content 'Welcome Test User'
		expect(page).to have_content("You have signed out")
		UserService.logout
	end 
end 



