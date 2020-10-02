class Accommodation

attr_reader :id, :name, :description, :location, :price, :host_id, :image_url

  def initialize(id:, name: , description: , location: , price:, host_id:, image_url: nil )
    @id = id
    @name = name
    @description = description
    @location = location
    @price = price
    @host_id = host_id
    @image_url = image_url
  end

end