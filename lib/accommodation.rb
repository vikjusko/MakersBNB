class Accommodation

attr_reader :id, :name, :description, :location, :price

  def initialize( id:, name: , description: , location: , price:)
    @id = id
    @name = name
    @description = description
    @location = location
    @price = price
  end

end