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

  # scenario 'user hosts one or more spaces' do
  #   load_test_user
  #   visit('/')
  #   click_link('Hosting')
  #   click_button('Add Listing')
  #   expect(current_path).to eq '/accommodations/create'
  #   fill_in('name', with: 'Caravan')
  #   fill_in('description', with: 'An absolute hell hole in the middle of nowhere')
  #   fill_in('location', with: 'Blackpool')
  #   fill_in('price', with: 120)
  #   fill_in('from_date', with: '2020-09-21')
  #   fill_in('to_date', with: '2020-10-19')
  #   click_button('Submit')
  #   click_link('Hosting')
  #   expect(page).to have_content("some placeholder text")
  # end

  # TODO fix - new accommodation can't be created due to duplicate key values.
end
