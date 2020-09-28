require 'database_connection'

describe DatabaseConnection do
  let(:conn_string) { "host=makersbnb-test.c5dg1llsxcel.eu-west-2.rds.amazonaws.com port=5432 user=team_red password=cc8kej!kd" }

  describe '.setup' do
    it 'sets up a database connection using PG' do
      expect(PG).to receive(:connect).with(conn_string).once
      DatabaseConnection.setup(conn_string)
    end

    it 'persists the database connection' do
      connection = DatabaseConnection.setup(conn_string)
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query(sql)' do
    it 'executes a given SQL query using PG' do
      connection = DatabaseConnection.setup(conn_string)
      sql = "SELECT * FROM accommodation;"

      expect(connection).to receive(:exec).with(sql)
      DatabaseConnection.query(sql)
    end
  end
end
