feature 'create a listing' do
  scenario 'host_id clicks on Add Accom and fills out a form' do
    visit '/'
    click_button('Add Listing')
    expect(current_path).to eq '/accommodations/create'
    fill_in('name', with: 'Caravan')
    fill_in('description', with: 'An absolute hell hole in the middle of nowhere')
    fill_in('location', with: 'Blackpool')
    fill_in('price', with: 120)
    fill_in('from_date', with: '2020-09-21')
    fill_in('to_date', with: '2020-10-19')
    click_button('Submit')
    #expect(page).to have_content('Your Caravan listing has been added.')
  end
end