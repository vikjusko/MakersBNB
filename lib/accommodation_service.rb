require_relative './accommodation'
require_relative './database_connection'

class AccommodationService

  def self.all
    result = DatabaseConnection.query("SELECT * FROM accommodation;")
    result.map {|accommodation| Accommodation.new(id: accommodation['id'], name: accommodation['name'], description: accommodation['description'], location: accommodation['location'], price: accommodation['price']) }
  end

  def self.create(name:, description:, location:, price:)
    result = DatabaseConnection.query("INSERT INTO accommodation (name, description, location, price) VALUES('#{name}', '#{description}', '#{location}', '#{price}') RETURNING id, name, description, location, price;")
    Accommodation.new(id: result[0]["id"], name: result[0]["name"], description: result[0]['description'], location: result[0]["location"], price: result[0]['price'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM accommodation WHERE id=#{id};")[0]
    Accommodation.new(id: result['id'], name: result['name'], description: result['description'], location: result['location'], price: result['price'])
  end
end 
