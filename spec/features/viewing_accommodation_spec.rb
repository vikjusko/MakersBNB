
feature 'View accomodation' do
  scenario 'A list accmmodation is viewed on sceen' do
    visit '/'
    click_button("View accommodation")
    expect(current_path).to eq("/accommodation")
    expect(page).to have_content("Nice cottage in Deptford")
  end
end