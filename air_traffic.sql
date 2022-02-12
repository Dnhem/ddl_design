-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  "state" TEXT NOT NULL,
  country TEXT NOT NULL,
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  seat TEXT NOT NULL,
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INT REFERENCES passengers (id),
  airline INT REFERENCES airlines (id),
  from INT REFERENCES locations (id),
  to INT REFERENCES locations (id),
  departure INT REFERENCES flights (id),
  destination INT REFERENCES flights (id)
);

INSERT INTO locations
  (city, state, country)
VALUES
  ("San Francisco", "CA", "United States"),
  ("Seattle", "WA", "United States"),
  ("New York", "NY", "United States");

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Sonja', 'Pauley'),
  ('Berkie', 'Wycliff');

INSERT INTO flights
  (departure, arrival, seat)
VALUES
  (2018-04-08 09:00:00, 2018-04-08 12:00:00, '33B'),
  (2018-12-22 14:42:00, 2018-12-22 15:56:00, '1A'),
  (2019-02-06 06:00:00, 2019-02-06 07:47:00, '5D');

INSERT INTO airlines
  (name)
VALUES
  ('Delta'),
  ('American'),
  ('United');

INSERT INTO tickets
  (passenger, airline, from, to)
VALUES
  (1, 1, 1, 2),
  (2, 2, 2, 2),
  (3, 3, 3, 2),


