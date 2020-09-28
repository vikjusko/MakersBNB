class Accommodation

attr_reader :name, :description, :location, :price

  def initialize(name: , description: , location: , price:)
    @name = name
    @description = description
    @location = location
    @price = price
  end

end