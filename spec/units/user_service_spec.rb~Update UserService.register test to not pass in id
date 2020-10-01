require 'user_service'
require 'user'
require 'database_connection'

describe UserService do

  describe '.register' do
    it 'stores a new user using PG' do
      expect(DatabaseConnection).to receive(:query).once
      UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
    end

    it 'returns the new user' do
      user = UserService.register(name: 'test name', email: 'test@email.com', password: 'pword123')
      expect(user).to be_a User
      expect(user.name).to eq 'test name'
      expect(user.email).to eq("test@email.com")
    end
  end
  #
  # describe '#find' do
  #   it 'finds a user by ID' do
  #     user = test_user
  #     result = Users.find(user.id)
  #
  #     expect(result.id).to eq user.id
  #     expect(result.email).to eq user.email
  #     expect(result.username).to eq user.username
  #   end
  #
  #   it 'returns nil if there is no ID given' do
  #     expect(Users.find(nil)).to eq nil
  #   end
  # end
  #
  # describe '#all' do
  #   it 'returns a list of users' do
  #     add_test_users
  #
  #     users = Users.all
  #
  #     expect(users.first).to be_a Users
  #   end
  # end
  #
  # describe '#authenticate' do
  #   it 'returns a user given a correct username and password, if one exists' do
  #     user = Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')
  #
  #     auth = Users.authenticate(username: 'test_username', password: 'pword123')
  #
  #     expect(auth.id).to eq user.id
  #   end
  #
  #   it "returns an error if the user doesn't exist" do
  #     user = Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')
  #
  #     expect(Users.authenticate(username: 'test_username', password: 'wrong-password')).to be_nil
  #   end
  #
  # end
end