require 'host_service'

describe HostService do
  describe '#.find_host_accommodation' do
    it 'returns each listing for the provided user_id' do
      user = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('Xavier', 'test@test.com', 'kjdhfghskfdg') RETURNING id;")
      accom = AccommodationService.create(name: 'Caravan', description: 'An absolute hell hole in the middle of nowhere', location: 'Blackpool', price: 120, host_id: user.first['id'])

      #expect(HostService.find_host_accommodation).to 
    end
  end
end
