require 'booking_service'
require 'accommodation'

describe BookingService do
 describe ".create" do
  it "creates a new booking with the details given and sets status to PENDING" do
      host = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('Test User', 'test@test.com', 'asdfadf') RETURNING id;")[0]
      accommodation = AccommodationService.create(name: "Nice cottage", description: "Cottage in London", location: "London", price: 40, host_id: host['id'])
      booking = BookingService.create(accommodation_id: accommodation.id, user_email: "test@test.com", date: "2020-09-29")
      expect(booking).to be_a Booking
      expect(booking.accommodation_id).to eq accommodation.id
      expect(booking.user_email).to eq("test@test.com")
      expect(booking.date).to eq("2020-09-29")
      expect(booking.status).to eq 'PENDING'
   end
  end
  
  describe '.all' do
    it "returns a list of all bookings" do
      host = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('Test User', 'test@test.com', 'asdfadf') RETURNING id;")[0]
      accommodation = AccommodationService.create(name: "Nice cottage", description: "Cottage in London", location: "London", price: 40, host_id: host['id'])
      booking = BookingService.create(accommodation_id: accommodation.id, user_email: "test@test.com", date: "2020-09-29")
      bookings = BookingService.all
   expect(bookings).to be_a Array
      expect(bookings.first.user_email).to eq booking.user_email
    end
  end
end 