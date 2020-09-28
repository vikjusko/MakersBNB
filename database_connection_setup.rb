require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  test_string = "host=makersbnb-test.c5dg1llsxcel.eu-west-2.rds.amazonaws.com port=5432 user=team_red password=cc8kej!kd"
  DatabaseConnection.setup(test_string)
else
  prod_string = "host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88##"
  DatabaseConnection.setup(prod_string)
end