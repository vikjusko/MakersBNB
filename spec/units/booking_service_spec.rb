require 'booking_service'
require 'accommodation'

<<<<<<< HEAD
describe BookingService do
	describe ".create" do
		it "creates a new booking with the details given and sets status to PENDING" do
      load_test_user
      load_test_accom
      booking = BookingService.create(accommodation_id: '2',
        user_email: "test@test.com", date: "2020-09-29")
      expect(booking).to be_a Booking
      expect(booking.accommodation_id).to eq '2'
      expect(booking.user_email).to eq("test@test.com")
      expect(booking.date).to eq("2020-09-29")
      expect(booking.status).to eq 'PENDING'
=======
describe BookingService do 
  
	describe "#create" do
    it "creates a new booking" do
    user = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('Xavier', 'test@test.com', 'kjdhfghskfdg') RETURNING id;")
    accommodation = AccommodationService.create(name: "Nice cottage", description: "Cottage in London", location: "London", from_date: "2020-09-29", to_date: "2020-10-29", price: 40, host_id: user.first['id'])
		bookingservice = BookingService.create(accommodation_id: accommodation.id, user_email: "test@test.com", date: "2020-09-29")
    expect(bookingservice).to be_a Booking
    expect(bookingservice.accommodation_id).to eq accommodation.id
		expect(bookingservice.user_email).to eq("test@test.com")
		expect(bookingservice.date).to eq("2020-09-29")
>>>>>>> 14a1477... (WIP) Test checking if date selected is available
  	end
  end

<<<<<<< HEAD
  describe '.all' do
    it "returns a list of all bookings" do
      load_test_user
      load_test_accom
      booking = BookingService.create(accommodation_id: '2', user_email: "test@test.com", date: "2020-09-29")

=======
  describe '#all' do
    it "produces a list of all bookings" do
      user = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('Xavier', 'test@test.com', 'kjdhfghskfdg') RETURNING id;")
      accommodation = AccommodationService.create(name: "Nice cottage", description: "Cottage in London", location: "London", from_date: "2020-09-29", to_date: "2020-10-29", price: 40, host_id: user.first['id'])
      bookingservice = BookingService.create(accommodation_id: accommodation.id, user_email: "test@test.com", date: "2020-09-29")
>>>>>>> 7803594... (WIP) working out the SQL Query
      bookings = BookingService.all
			expect(bookings).to be_a Array
      expect(bookings.first.user_email).to eq booking.user_email
    end
  end

<<<<<<< HEAD
  describe '.find_booking(id)' do
    it 'returns a booking object for the given id if it exists' do
      load_test_user
      load_test_accom

      expected = BookingService.create(accommodation_id: 1, user_email: "test@test.com", date: "2020-09-29")

      actual = BookingService.find_booking(expected.id)

      expect(actual).to be_an_instance_of(Booking)
      expect(actual.id).to eq expected.id
      expect(actual.user_email).to eq expected.user_email
    end

    it 'returns false if no booking found for given id' do
      load_test_user
      load_test_accom

      booking = BookingService.create(accommodation_id: 1, user_email: "test@test.com", date: "2020-09-29")

      expect(BookingService.find_booking(booking.id.to_i+1)).to eq false
    end

    describe '.confirm_booking(booking_id)' do
      context 'booking date is available' do
        it 'updates the booking status to CONFIRMED and returns the updated booking' do
          load_test_user
          load_test_accom
          booking = BookingService.create(accommodation_id: 1, user_email: "test@test.com", date: "2020-09-29")
          actual = BookingService.confirm_booking(booking.id)

          expect(actual).to be_an_instance_of(Booking)
          expect(actual.id).to eq(booking.id)
          expect(actual.status).to eq 'CONFIRMED'
        end
      end

      context 'booking date is not available' do
        #TODO once the availability checks are done
      end

    end

  end
end 
=======
  describe '#.date_available?' do

    it 'returns true OR false if date selected is inside OR outside available dates' do
      user = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('Xavier', 'test@test.com', 'kjdhfghskfdg') RETURNING id;")
      accommodation = AccommodationService.create(name: "Nice cottage", description: "Cottage in London", location: "London", from_date: "2020-09-29", to_date: "2020-10-29", price: 40, host_id: user.first['id'])
      results1 = BookingService.date_available?("2020-09-30")
      expect(results1).to eq true
      results2 = BookingService.date_available?("2020-09-28")
      expect(results2).to eq false
    end
  end
end 
>>>>>>> 14a1477... (WIP) Test checking if date selected is available
