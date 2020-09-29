require 'booking_service'

describe BookingService do 
	describe "#create" do
		it "creates a new booking" do
    bookingservice = BookingService.create(accommodation_id: 4, user_email: "test@test.com", date: "2020-09-29")
    persisted_data = persisted_data(id: booking.id)
    expect(bookingservice).to be_a BookingService
    expect(bookingservice.id).to eq persisted_data["id"]
    expect(bookingservice.accommodation_id).to eq 4
		expect(bookingservice.user_email).to eq("test@test.com")
		expect(booking_service.date).to eq("2020-09-29")
  	end
  end

  describe '#all' do
    it "produces a list of all bookings" do
      bookingservice = BookingService.create(accommodation_id: 4, user_email: "test@test.com", date: "2020-09-29")
      bookings = bookingservice.all

      expect(bookings.first.accommodation_id).to eq 4
      expect(bookings.first.user_email).to eq "test@test.com"
    end
  end
end 
