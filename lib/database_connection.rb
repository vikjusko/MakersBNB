require 'pg'

class DatabaseConnection
  def self.setup
    conn_string = "host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88##"
    @connection = PG.connect(conn_string)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end