require_relative 'booking'
require_relative 'database_connection'

class BookingService
  DEFAULT_STATUS = 'PENDING'

  def self.create(accommodation_id:, user_email:, date: )
    return false unless self.date_available?(accommodation_id, date)
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
  end
  
private

  def self.date_available?(accommodation_id, date)
    availability = DatabaseConnection.query("SELECT from_date, to_date FROM availability WHERE accommodation_id = '#{accommodation_id}';")[0]
    from_date = Date.parse(availability['from_date'])
    to_date = Date.parse(availability['to_date'])
    booked_dates = DatabaseConnection.query("SELECT date FROM booking WHERE accommodation_id = '#{accommodation_id}' AND status = 'CONFIRMED';")
    booked_dates.map! {|date| Date.parse date}

    return false unless date.between?(from_date, to_date) 
    return false if booked_dates.include?(date)
    true
  end

end
