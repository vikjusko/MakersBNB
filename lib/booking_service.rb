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
    booking = self.find_booking(booking_id)
    return false unless self.date_available?(booking.accommodation_id, booking.date)
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

    def self.date_available?(accom_id, date)
      booking_date = Date.parse(date)
      available = self.accom_availability(accom_id)

      return false unless booking_date.between?(available[:from_date], available[:to_date])
      return false if self.booked_dates(accom_id).include?(booking_date)
      true
    end

    def self.accom_availability(accommodation_id)
      availability = DatabaseConnection.query(
        "SELECT from_date, to_date FROM availability
         WHERE accommodation_id = '#{accommodation_id}';")[0]
      from_date = Date.parse(availability['from_date'])
      to_date = Date.parse(availability['to_date'])
      { from_date: from_date, to_date: to_date }
    end

    def self.booked_dates(accommodation_id)
      booked_dates = DatabaseConnection.query(
        "SELECT date FROM booking
        WHERE accommodation_id = '#{accommodation_id}'
        AND status = 'CONFIRMED';")
      booked_dates.map { |booking| Date.parse(booking['date']) }
    end
end

