feature 'making a booking' do
  scenario 'user inputs email & date and hits submit' do
    load_test_accom

    visit('/accommodations')
    click_link('See more', :match => :first)
    click_link('Request Booking')
    expect(page).to have_content("Start your booking:")
    fill_in("user_email", with: "test@test.com")
    fill_in("date", with: "2020-09-29")
    click_on("Request booking")
    expect(page).to have_content("Your booking has been requested")
  end

  # add test for non-functional email.

end
