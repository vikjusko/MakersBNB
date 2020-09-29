require 'booking'
require_relative 'database_connection'
#require_relative '../database_connection_setup.rb'

class BookingService

	def self.create(accommodation_id:, user_email:, date: )
    result = DatabaseConnection.query("INSERT INTO booking(accommodation_id, user_email, date) VALUES('#{accommodation_id}', '#{user_email}', '#{date}') RETURNING id, accommodation_id, user_email, date;")
		Booking.new(id: result[0]["id"], accommodation_id: result[0]['accommodation_id'], user_email: result[0]["user_email"], date: result[0]["date"])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM booking")
    
    result.map { |booking| 
      Booking.new(
        id: booking['id'],
        accommodation_id: booking['accommodation_id'],
        user_email: booking['user_email'],
        date: booking['date']
        )
    }
  end
end 
