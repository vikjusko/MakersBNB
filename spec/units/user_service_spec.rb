require 'user_service'
require 'user'
require 'database_connection'

describe UserService do

  describe '.register' do
    it 'stores a new user using PG' do
      UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
      #add a .find method to make sure that the user has been stored and registered
    end

    it 'returns the new user' do
      user = UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
      expect(user).to be_a User
      expect(user.name).to eq 'test name'
      expect(user.email).to eq("test@email.com")
    end
  end
  
  
  describe '#self_login' do
    it 'returns a user given a correct email  and password, if one exists' do
      user = UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
  
      auth = UserService.login(email: 'test@email.com', password: 'pword123')
  
      expect(auth.id).to eq user.id
    end
  
    it "returns an error if the user doesn't exist" do
      user = UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
  
      expect(UserService.login(email: 'test@gmail.com', password: 'wrong-password')).to eq false
    end
  
  end
end