require 'booking'
require 'accommodation'


describe Booking do
  let(:space) { Accomodation.new(name: "Cottage", description: "Nice cottage in Deptford", location: "London", price: 40)}

  booking = Booking.new(id: 1, accommodation_id: 1, user_email: "test_email@email.com", date: "2020-09-29")

  describe '#initialize' do
    it 'initializes with 4 parameters' do
      expect(booking.user_email).to eq "test_email@email.com"
      expect(booking.date).to eq "2020-09-29"
    end
  end

end
