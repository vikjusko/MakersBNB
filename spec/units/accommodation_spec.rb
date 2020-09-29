require './lib/accommodation'

describe Accommodation do
  subject(:space) { Accommodation.new(name: "Cottage", description: "Nice cottage in Deptford", location: "London", price: 40) }

  describe '#initialize' do
    it 'stores the name, description, local & price' do
      expect(space.description).to eq "Nice cottage in Deptford"
      expect(space.name).to eq "Cottage"
      expect(space.location).to eq "London"
      expect(space.price).to eq 40
    end
  end

end