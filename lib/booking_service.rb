require 'booking'
require_relative 'database_connection'
class BookingService

	def self.create(accommodation_id:, user_email:, date: )
		result = DatabaseConnection.query("INSERT INTO booking(accommodation_id, user_email, date) VALUES('#{accommodation_id}', '#{user_email}', '#{date}') RETURNING accommodation_id, user_email, date;")
		Booking.new(id: result[0]["id"], accommodation_id: result[0]['accommodation'], user_email: result[0]["user_email"], date: result[0]["date"])
	end 
end 


