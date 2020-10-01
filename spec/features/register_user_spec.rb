feature 'Register user' do
  scenario 'User registration with unique email is successful' do
    visit '/sign-up'
    fill_in 'email', with: '123@email.com'
    fill_in 'name', with: 'Test User'
    fill_in 'password', with: 'h3ll0wor!d'
    click_button 'Sign up'
    expect(page).to have_content('Welcome Test User')
  end
end

# TODO: test that you are redirected back to previous page