feature 'reviewing a pending booking' do
  scenario 'user hosts no accommodation' do
    load_test_user

    visit('/')
    click_link('Log in')
    fill_in('email', with: 'test_email@email.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    expect(page).to have_link('Hosting')
    click_link('Hosting')
    expect(page).to have_content("You aren't hosting any properties yet.")
  end
end
