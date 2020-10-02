require 'booking'
require 'accommodation'

describe Booking do
  subject(:booking) { Booking.new(id: 1, accommodation_id: 1, user_email: "test_email@email.com", date: "2020-09-29", status: 'PENDING') }

  describe '#initialize' do
    it 'stores the booking parameters on initialization' do
      expect(booking.user_email).to eq "test_email@email.com"
      expect(booking.date).to eq "2020-09-29"
      expect(booking.status).to eq 'PENDING'
    end
  end

end
