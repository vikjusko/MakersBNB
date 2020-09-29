feature 'making a booking' do
  scenario 'user inputs email & date and hits submit' do
    visit('/booking')
    expect(page).to have_content("Start your booking:")

    fill_in("user_email", with: "test@test.com")
    fill_in("date", with: "2020-09-29")
    click_on("Request booking")
    expect(page).to have_content("Booking submitted")
  end
end
