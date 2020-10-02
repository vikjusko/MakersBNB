require 'host_service'

describe HostService do

  describe '#.find_pending_requests(host_id)' do
    it 'returns all pending booking requests for the provided user_id' do
      load_test_user
      load_test_accom
      booking_id = '21'
      DatabaseConnection.query(
        "INSERT INTO booking(id, accommodation_id, user_email, date, status)
        VALUES(#{booking_id}, 1, 'test@user.com', '2020-09-29', 'PENDING');")
      pending_requests = HostService.find_pending_requests(1)

      expect(pending_requests[0]).to be_an_instance_of(Booking)
      expect(pending_requests[0].id).to eq booking_id
      expect(pending_requests.count).to eql 1
      expect(pending_requests[0].status).to eq 'PENDING'
    end

    it 'does not return bookings that arent for the provided user_id' do
      load_test_user
      load_test_accom
      booking_id = '21'
      DatabaseConnection.query(
        "INSERT INTO booking(id, accommodation_id, user_email, date, status)
        VALUES(#{booking_id}, 1, 'test@user.com', '2020-09-29', 'PENDING');")

      pending_requests = HostService.find_pending_requests('2')

      expect(pending_requests.count).to eql 0
    end
  end

  describe '#.approve_request(booking_id)' do
    context 'current user is the accommodation host' do
      it 'sends a message to BookingService to confirm booking' do
        load_test_user
        load_test_accom
        booking_id = '21'
        DatabaseConnection.query(
          "INSERT INTO booking(id, accommodation_id, user_email, date, status)
          VALUES(#{booking_id}, 1, 'test@user.com', '2020-09-29', 'PENDING');")

        expect(BookingService).to receive(:confirm_booking).once.with(booking_id)
        HostService.approve_request(booking_id)
      end

      it 'returns the updated booking object' do
        load_test_user
        load_test_accom
        booking_id = '21'
        DatabaseConnection.query(
          "INSERT INTO booking(id, accommodation_id, user_email, date, status)
          VALUES(#{booking_id}, 1, 'test@user.com', '2020-09-29', 'PENDING');")

        actual = HostService.approve_request(booking_id)
        expect(actual).to be_a(Booking)
        expect(actual.id).to eq(booking_id)
        expect(actual.status).to eq('CONFIRMED')
      end
    end
  end

  # TODO booking not found
  # TODO current user not the host for the booking accom
end
