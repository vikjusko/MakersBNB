require_relative 'booking'
require_relative 'database_connection'
#require_relative '../database_connection_setup.rb'

class BookingService
  DEFAULT_STATUS = 'PENDING'

	def self.create(accommodation_id:, user_email:, date: )
    result = DatabaseConnection.query("INSERT INTO booking(accommodation_id, user_email, date, status) VALUES(#{accommodation_id}, '#{user_email}', '#{date}', '#{DEFAULT_STATUS}') RETURNING id, accommodation_id, user_email, date, status;")
		Booking.new(id: result[0]['id'], accommodation_id: result[0]['accommodation_id'], user_email: result[0]['user_email'], date: result[0]['date'], status: result[0]['status'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM booking")
    
    result.map { |booking| 
      Booking.new(
        id: booking['id'],
        accommodation_id: booking['accommodation_id'],
        user_email: booking['user_email'],
        date: booking['date'],
        status: booking['status']
        )
    }
  end
end
