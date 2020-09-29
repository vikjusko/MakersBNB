require_relative './accommodation'
require_relative './database_connection'

class AccommodationService

  def self.all
    result = DatabaseConnection.query("SELECT * FROM accommodation;")
    result.map {|accommodation| Accommodation.new(id: accommodation['id'], name: accommodation['name'], description: accommodation['description'], location: accommodation['location'], price: accommodation['price']) }
  end

end
