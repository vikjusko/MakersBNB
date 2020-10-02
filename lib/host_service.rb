require_relative 'booking'
require_relative './database_connection'
require_relative './accommodation'


class HostService
  # def self.find_host_accommodation
  #   DatabaseConnection.query("SELECT * FROM accommodation WHERE host_id = '#{host_id}';")
  # end
  #
  def self.all(host_id)
    result = DatabaseConnection.query("SELECT * FROM accommodation WHERE host_id = #{host_id}")
    result.map { |accommodation| Accommodation.new(id: accommodation["id"], name: accommodation["name"], description: accommodation["description"], location: accommodation["location"], price: accommodation["price"], host_id: accommodation["host_id"]) }
  end 


  def self.find_pending_requests(host_id)
    result = DatabaseConnection.query(
      "SELECT b.id, b.accommodation_id, b.user_email, b.date, b.status
      FROM booking as b JOIN accommodation as a
      ON b.accommodation_id = a.id
      WHERE host_id = '#{host_id}'
      AND b.status = 'PENDING';")
    result.map do |b|
      Booking.new(id: b['id'], accommodation_id: b['accommodation_id'],
        user_email: b['user_email'], date: b['date'], status: b['status'])
    end
  end

  def self.approve_request(booking_id)
    # TODO return false booking not found
    # TODO return false if current user is not host for booking accom
    BookingService.confirm_booking(booking_id)
  end


end
