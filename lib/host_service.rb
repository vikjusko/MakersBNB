require_relative 'booking'
require_relative './database_connection'


class HostService
  # def self.find_host_accommodation
  #   DatabaseConnection.query("SELECT * FROM accommodation WHERE host_id = '#{host_id}';")
  # end

  def self.find_pending_requests(host_id)
    result = DatabaseConnection.query("SELECT b.id, b.accommodation_id, b.user_email, b.date, b.status FROM booking as b JOIN accommodation as a
      ON b.accommodation_id = a.id
      WHERE host_id = '#{host_id}'
      AND b.status = 'PENDING';")
    result.map { |b| Booking.new(id: b['id'], accommodation_id: b['accommodation_id'], user_email: b['user_email'], date: b['date'], status: b['status']) }
  end
end