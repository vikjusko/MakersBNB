require_relative './accommodation'
require_relative './database_connection'

class AccommodationService

  def self.all
    result = DatabaseConnection.query("SELECT * FROM accommodation;")
    result.map {|accommodation| Accommodation.new(id: accommodation['id'], name: accommodation['name'], description: accommodation['description'], location: accommodation['location'], price: accommodation['price'], host_id: accommodation['host_id']) }
  end

  def self.create(name:, description:, location:, price:, from_date:, to_date:, host_id:)
    result = DatabaseConnection.query("INSERT INTO accommodation(name, description, location, price, host_id) VALUES('#{name}', '#{description}', '#{location}', '#{price}', '#{host_id}') RETURNING id, name, description, location, price, host_id;")
    avail = DatabaseConnection.query("INSERT INTO availability(accommodation_id, from_date, to_date) VALUES('#{result[0]['id']}', '#{from_date}', '#{to_date}') RETURNING from_date, to_date;")
    Accommodation.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], location: result[0]['location'], price: result[0]['price'], from_date: avail[0]['from_date'], to_date: avail[0]['to_date'], host_id: result[0]['host_id'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM accommodation WHERE id=#{id};")[0]
    Accommodation.new(id: result['id'], name: result['name'], description: result['description'], location: result['location'], price: result['price'], host_id: result['host_id'])
  end
end 
