describe AccommodationService do

  describe '#.all' do
    it 'returns a list of accommodation' do
      AccommodationService.create(name: "Cottage", description: "Nice cottage in Deptford", location: "London", price: 40)
      accom_list = AccommodationService.all
      expect(accom_list.first.description).to eq "Nice cottage in Deptford"
    end
  end

end