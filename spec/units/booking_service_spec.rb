require 'booking_service'
require 'accommodation'

describe BookingService do 
	describe "#create" do
		it "creates a new booking" do
		accommodation = Accommodation.new(name: "Daptford cottage", description: "Lovely cottage", location: "Daptrford", price: "£120.00")
    bookingservice = BookingService.create(accommodation_id: accommodation.id, user_email: "test@test.com", date: "2020-09-29")
    persisted_data = persisted_data(id: booking.id)
    expect(bookingservice).to be_a BookingService
    expect(bookingservice.id).to eq persisted_data["id"]
    expect(bookingservice.accommodation_id).to eq accommodation.id
		expect(bookingservice.user_email).to eq("test@test.com")
		expect(booking_service.date).to eq("2020-09-29")
  	end
  end

  # describe '#all' do
  #   it "produces a list of all bookings" do
  #     bookingservice = BookingService.create(user_email: "test@test.com", date: Today.new)
  #     bookings = BookingService.all
	# 		#expect(bookings.first.accommodation_id).to eq '4'
	# 		expect(bookings).to be_a BookingService
  #     expect(bookings.first.user_email).to eq "test@test.com"
  #   end
  # end
end 
