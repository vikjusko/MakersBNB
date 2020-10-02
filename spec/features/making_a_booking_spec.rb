feature 'making a booking' do
  scenario 'logged in user requests booking for available date' do
    load_test_user
    load_test_accom

    sign_up
    visit('/accommodations')
    click_link('See more', :match => :first)
    click_link('Request Booking')
    expect(page).to have_content("Start your booking:")
    fill_in("date", with: "2020-09-29")
    click_on("Request booking")
    expect(page).to have_content("Your booking has been requested")
    log_out
  end

  scenario 'displays error when unauthenticated user requests booking' do
    load_test_user
    load_test_accom

    visit('/accommodations')
    click_link('See more', :match => :first)
    click_link('Request Booking')
    expect(page).to have_content("You must be logged in to request a booking")
  end

  scenario 'displays error when requesting booking for unavailable date' do
    load_test_user
    load_test_accom
    DatabaseConnection.query("INSERT INTO booking (accommodation_id, user_email, date, status) VALUES(2, 'test1@test.com', '2020-10-29', 'CONFIRMED')")
    DatabaseConnection.query("INSERT INTO booking (accommodation_id, user_email, date, status) VALUES(1, 'test1@test.com', '2020-10-29', 'CONFIRMED')")

    sign_up
    visit('/accommodations')
    click_link('See more', :match => :first)
    click_link('Request Booking')
    expect(page).to have_content("Start your booking:")
    fill_in("date", with: "2020-10-29")
    click_on("Request booking")
    expect(page).to have_content("Requested date is unavailable")
    log_out
  end

  # add test for non-functional email.

end
