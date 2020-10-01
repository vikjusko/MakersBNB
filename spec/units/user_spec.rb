require 'user'

describe User do
  subject(:user) { User.new(id: '1', email: 'test@email.com', name: 'Test User') }

  it 'stores id, email and name on initialization' do
    expect(user.id).to eq '1'
    expect(user.email).to eq 'test@email.com'
    expect(user.name).to eq 'Test User'
  end
end