require 'pg'

class DatabaseConnection
  def self.setup(conn_string)
    @connection = PG.connect(conn_string)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end