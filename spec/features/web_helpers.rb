def view_space_details
  visit '/accommodations'
  click_button 'See more'
end

def log_out
  visit '/'
  click_button 'Log out'
end

def log_in
  UserService.register(name: 'test', email: 'test@test.com', password: '1234567')
	UserService.logout
  visit '/'
  click_button('Log in')
  expect(page).to have_current_path('/login')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: '1234567')
  click_button('Log in')
end
