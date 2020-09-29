require './lib/accommodation_service'


describe AccommodationService do

  describe '#.all' do
    it 'returns a list of accommodation' do
      DatabaseConnection.query("INSERT INTO accommodation(name, description, location, price) VALUES('Cottage', 'Nice cottage in Deptford', 'London', 40);")
      accom_list = AccommodationService.all
      expect(accom_list.first.description).to eq "Nice cottage in Deptford"
    end
  end

end