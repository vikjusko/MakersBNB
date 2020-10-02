require './spec/database_helper'

feature 'View all accommodation' do
  scenario 'A list of accommodation is displayed on screen' do
    load_test_accom
    visit '/'
    click_link("Accommodation")
    expect(current_path).to eq("/accommodations")
    expect(page).to have_content("Beach shack")
    expect(page).to have_content("Cottage")
  end
end