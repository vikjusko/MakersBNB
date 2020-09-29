require './spec/database_helper'

feature 'View all accommodation' do
  scenario 'A list of accommodation is viewed on sceen' do
    load_test_accom
    visit '/'
    click_button("View accommodation")
    expect(current_path).to eq("/accommodations")
    expect(page).to have_content("Beach shack")
    expect(page).to have_content("Cottage")
  end
end