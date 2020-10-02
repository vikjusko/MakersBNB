require_relative 'booking'
require_relative 'database_connection'

class BookingService
  DEFAULT_STATUS = 'PENDING'

	def self.create(accommodation_id:, user_email:, date: )
    result = DatabaseConnection.query(
      "INSERT INTO booking(accommodation_id, user_email, date, status)
      VALUES(#{accommodation_id}, '#{user_email}', '#{date}', '#{DEFAULT_STATUS}')
      RETURNING id, accommodation_id, user_email, date, status;")
    self.return_booking(result[0])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM booking")
    result.map { |booking| 
      self.return_booking(booking)
    }
  end

  def self.find_booking(booking_id)
    result = DatabaseConnection.query(
      "SELECT * FROM booking WHERE id = '#{booking_id}'")
    return false unless result.count == 1
    self.return_booking(result[0])
  end

  def self.confirm_booking(booking_id)
    result = DatabaseConnection.query(
      "UPDATE booking
      SET status = 'CONFIRMED'
      WHERE id = #{booking_id}
      RETURNING id, accommodation_id, user_email, date, status;"
    )
    return false unless result.count == 1
    return_booking(result[0])
  end

  private

  def self.return_booking(booking)
    Booking.new(
      id: booking['id'],
      accommodation_id: booking['accommodation_id'],
      user_email: booking['user_email'],
      date: booking['date'],
      status: booking['status']
    )

  def self.date_available?(date_selected)
    booking = DatabaseConnection.query("SELECT * FROM booking WHERE date = '#{date_selected}';")
    return false unless booking.count == 1
    date1 = DatabaseConnection.query("SELECT id FROM availability WHERE '#{date_selected}' BETWEEN from_date AND to_date;")
    date1.count == 1
  end

# SELECT date
# FROM booking
# INNER JOIN availability
# ON booking.accommodation_id = availability.accommodation_id
# WHERE booking.date BETWEEN availability.from_date AND availability.to_date;

end
