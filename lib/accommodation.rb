class Accommodation

attr_reader :id, :name, :description, :location, :price, :from_date, :to_date, :host_id

  def initialize(id:, name: , description: , location: , price:, from_date:, to_date:, host_id: )
    @id = id
    @name = name
    @description = description
    @location = location
    @price = price
    @from_date = from_date
    @to_date = to_date
    @host_id = host_id
  end

end