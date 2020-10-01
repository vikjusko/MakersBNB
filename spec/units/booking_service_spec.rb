require 'booking_service'
require 'accommodation'

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
  	end
  end

  describe '.all' do
    it "returns a list of all bookings" do
      load_test_user
      load_test_accom
      booking = BookingService.create(accommodation_id: '2', user_email: "test@test.com", date: "2020-09-29")

      bookings = BookingService.all
			expect(bookings).to be_a Array
      expect(bookings.first.user_email).to eq booking.user_email
    end
  end

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

  end
end 