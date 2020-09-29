class Booking 

  attr_reader :id, :accommodation_id, :user_email, :date

  def initialize(id: , accommodation_id: , user_email: , date: )
    @id = id
    @accommodation_id = accommodation_id
    @user_email = user_email
    @date = date
  end

end
