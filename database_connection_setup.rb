require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  test_string = "host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test"
  DatabaseConnection.setup(test_string)
else
  prod_string = "host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb"
  DatabaseConnection.setup(prod_string)
end