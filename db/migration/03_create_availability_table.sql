CREATE TABLE availability(id SERIAL PRIMARY KEY, accommodation_id int, from_date DATE, to_date DATE,
CONSTRAINT fk_accommodation_id FOREIGN KEY(accommodation_id) REFERENCES accommodation(id));