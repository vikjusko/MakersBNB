def setup_and_clear_test_database
  connection = PG.connect("host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test")
  connection.exec('TRUNCATE TABLE accommodation, booking;')
end