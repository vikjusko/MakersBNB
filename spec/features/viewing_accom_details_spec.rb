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
end