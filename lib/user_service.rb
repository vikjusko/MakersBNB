require 'bcrypt'

require_relative './user'
require_relative "./database_connection"


class UserService

  def self.register(name:, email:,  password:)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{BCrypt::Password.create(password)}') RETURNING id, name, email;")
    @user = User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end
  
  def self.login(email:, password:)
    user = get_user(email)
    return false if user == false
    return false unless password_match?(user, password)
    @user = User.new(id: user['id'], name: user['name'], email: user['email'])
  end
  
  def self.logout
    @user = nil
  end
  
  def self.current_user
    @user
  end

  private

  def self.get_user(email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return false unless result.count == 1
    result[0]
  end
  
  def self.password_match?(user, password)
    BCrypt::Password.new(user['password']) == password
  end
end