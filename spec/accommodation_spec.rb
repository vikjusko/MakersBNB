require './lib/accommodation'

describe Accommodation do
  
  describe '#initialize' do
    it 'initialize with 4 parameters' do
      space = Accommodation.new(name: "Cottage", description: "Nice cottage in Deptford", location: "London", price: 40)
      expect(space.name).to eq "Cottage"
    end
  end

end