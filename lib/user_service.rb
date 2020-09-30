require 'bcrypt'

require_relative './user'
require_relative './database_connection'

class UserService

  def self.register(email:, name:, password:)
    result = DatabaseConnection.query("INSERT INTO users (email, name, password)
        VALUES('#{email}', '#{name}', '#{BCrypt::Password.create(password)}')
        RETURNING id, email, name;")
    @user = User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  # def self.login(username, password)
  #   user = get_user(username)
  #   return false if user == false
  #   return false unless password_match?(user, password)
  #   @user = User.new(user['username'], user['name'], user['email'])
  # end
  #
  # def self.logout
  #   @user = nil
  # end
  #
  # def self.current_user
  #   @user
  # end

  private

  # def self.get_user(username)
  #   result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
  #   false unless result.count == 1
  #   result[0]
  # end
  #
  # def self.password_match?(user, password)
  #   BCrypt::Password.new(user['password']) == password
  # end
end