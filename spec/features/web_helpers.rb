def view_space_details
  visit '/accommodations'
  click_button 'See more'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'email', with: '123@email.com'
  fill_in 'name', with: 'Test User'
  fill_in 'password', with: 'h3ll0wor!d'
  click_button 'Sign up'
end

def sign_up_and_add_accom
  click_button('Add Listing')
  expect(current_path).to eq '/accommodations/create'
  fill_in('name', with: 'Caravan')
  fill_in('description', with: 'An absolute hell hole in the middle of nowhere')
  fill_in('location', with: 'Blackpool')
  fill_in('price', with: 120)
  fill_in('from_date', with: '2020-09-21')
  fill_in('to_date', with: '2020-10-19')
  click_button('Submit')
end

def log_out
  visit '/'
  click_link 'Log out'
end

def log_in
  UserService.register(name: 'test', email: 'test@test.com', password: '1234567')
	UserService.logout
  visit '/'
  click_link('Log in')
  expect(page).to have_current_path('/login')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: '1234567')
  click_button('Log in')
end
