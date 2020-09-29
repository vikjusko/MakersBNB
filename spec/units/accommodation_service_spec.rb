describe AccommodationService do

  describe '#.all' do
    it 'returns a list of accommodation' do
      # 
      accom_list = AccommodationService.all
      expect(accom_list.first.description).to eq "Nice cottage in Deptford"
    end
  end

end