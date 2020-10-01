require 'host_service'

describe HostService do
  # describe '#.find_host_accommodation' do
  #   it 'returns each listing for the provided user_id' do
  #     user = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('Xavier', 'test@test.com', 'kjdhfghskfdg') RETURNING id;")
  #     accom = AccommodationService.create(name: 'Caravan', description: 'An absolute hell hole in the middle of nowhere', location: 'Blackpool', price: 120, host_id: user.first['id'])
  #
  #     #expect(HostService.find_host_accommodation).to
  #   end
  # end

  describe '#.find_pending_requests(host_id)' do
    it 'returns all pending booking requests for the provided user_id' do
      user = UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
      accom = AccommodationService.create(name: 'Caravan', description: 'Lovely accommodation', location: 'Cornwall', price: 120, host_id: user.id)
      booking = BookingService.create(accommodation_id: accom.id, user_email: "test@test.com", date: "2020-09-29")

      pending_requests = HostService.find_pending_requests(user.id)

      expect(pending_requests[0]).to be_an_instance_of(Booking)
      expect(pending_requests[0].id).to eq booking.id
      expect(pending_requests.count).to eql 1
      expect(pending_requests[0].status).to eq 'PENDING'
    end

    it 'does not return bookings that arent for the provided user_id' do
      user = UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
      accom = AccommodationService.create(name: 'Caravan', description: 'Lovely accommodation', location: 'Cornwall', price: 120, host_id: user.id)
      booking = BookingService.create(accommodation_id: accom.id, user_email: "test@test.com", date: "2020-09-29")

      pending_requests = HostService.find_pending_requests('2')

      expect(pending_requests.count).to eql 0
    end
  end
end
