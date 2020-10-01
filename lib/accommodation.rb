class Accommodation

attr_reader :id, :name, :description, :location, :price, :host_id

  def initialize(id:, name: , description: , location: , price:, host_id: )
    @id = id
    @name = name
    @description = description
    @location = location
    @price = price
    @host_id = host_id
  end

end