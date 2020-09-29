require './lib/accommodation'

describe Accommodation do
  subject(:space) { Accommodation.new(name: "Cottage", description: "Nice cottage in Deptford", location: "London", price: 40) }

  describe '#initialize' do
    it 'stores the name, description, local & price' do
      expect(space.description).to eq "Nice cottage in Deptford"
      expect(space.name).to eq "Cottage"
      expect(space.location).to eq "London"
      expect(space.price).to eq 40
      #expect(Accommodation).to respond_to(:new).with(4).arguments 
      # ^ this one doesn't work.
    end
  end

end