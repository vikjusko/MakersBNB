class Booking 

  attr_reader :id, :accommodation_id, :user_email, :date, :status

  def initialize(id:, accommodation_id:, user_email:, date:, status:)
    @id = id
    @accommodation_id = accommodation_id
    @user_email = user_email
    @date = date
    @status = status
  end
end