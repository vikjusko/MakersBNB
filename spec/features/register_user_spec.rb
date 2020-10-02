feature 'Register user' do
  scenario 'User registration with unique email is successful' do
    visit '/'
    click_link('Sign up')
    expect(page).to have_current_path('/sign-up')
    fill_in 'email', with: '123@email.com'
    fill_in 'name', with: 'Test User'
    fill_in 'password', with: 'h3ll0wor!d'
    click_button 'Sign up'
    expect(page).not_to have_button('Sign up')
    expect(page).to have_content('Thank you for signing up')
    UserService.logout
  end

  scenario 'User registration with non-unique email re-directs to the registration page with an error' do
    visit '/'
    click_link('Sign up')
    expect(page).to have_current_path('/sign-up')
    fill_in 'email', with: '123@email.com'
    fill_in 'name', with: 'Test User'
    fill_in 'password', with: 'h3ll0wor!d'
    click_button 'Sign up'
    UserService.logout
    visit '/'
    click_link('Sign up')
    expect(page).to have_current_path('/sign-up')
    fill_in 'email', with: '123@email.com'
    fill_in 'name', with: 'Test User'
    fill_in 'password', with: 'h3ll0wor!d'
    click_button 'Sign up'
    expect(page).to have_content("These details are already in use, try signing in instead.")
  end
end
