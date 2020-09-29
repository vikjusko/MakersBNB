require './lib/accommodation'

describe Accommodation do
  subject(:space) { Accommodation.new(name: "Cottage", description: "Nice cottage in Deptford", location: "London", price: 40) }

  describe '#initialize' do
    it 'initialize with 4 parameters' do
      expect(space.description).to eq "Nice cottage in Deptford"
      expect(space.name).to eq "Cottage"
      expect(space.location).to eq "London"
      expect(space.price).to eq 40
      # expect(Peep).to respond_to(:new).with(4).arguments 
      # ^ this one doesn't work.
    end
  end

end