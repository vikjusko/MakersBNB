require './spec/database_helper'

feature 'View accommodation details' do
  scenario 'Clicking accommodation from list displays the accommodation details' do
    load_test_accom
    visit '/accommodations'
    click_link("See more", :match => :first)
    expect(page).to have_content('Cottage')
    expect(page).to have_content('The cottage is a contemporary, well equipped space a perfect romantic countryside escape.')
    expect(page).to have_content('London')
    expect(page).to have_content('£40')
    expect(page).not_to have_content('Beach shack')
  end

  scenario 'Displays a Request booking takes to booking form' do
    load_test_accom
    visit '/accommodations/1'
    expect(page).to have_link('Request Booking', href: '/booking?accommodation_id=1')
    click_link('Request Booking')
    expect(page).to have_current_path('/booking?accommodation_id=1')
  end
end
