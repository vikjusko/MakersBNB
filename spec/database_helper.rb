
def setup_and_clear_test_database
  connection = PG.connect("host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test")
  connection.exec('TRUNCATE TABLE accommodation, booking, users, availability;')
end

def load_test_accom
  connection = PG.connect("host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test")
  connection.exec("INSERT INTO accommodation(id, name, description, location, price) VALUES(1, 'Cottage', 'The cottage is a contemporary, well equipped space a perfect romantic countryside escape.', 'London', 40);")
  connection.exec("INSERT INTO accommodation(id, name, description, location, price) VALUES(2, 'Beach shack', 'A first floor apartment with spectacular views and bright and airy decor that echoes the sea in every room.', 'Cornwall', 60);")
end