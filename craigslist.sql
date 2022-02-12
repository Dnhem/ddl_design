DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(40),
  region INT REFERENCES regions (id)
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category TEXT
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users (id),
  title TEXT,
  description TEXT,
  region INT REFERENCES regions (id),
  category INT REFERENCES categories (id),
  location VARCHAR(40)
);

INSERT INTO regions
  (name)
VALUES
  ('San Francisco, Bay Area'),
  ('Atlanta'),
  ('Seattle');

INSERT INTO users
  (name, region)
VALUES
  ('Chickens_Guy1995', 1),
  ('CoolGal', 2),
  ('TruckerMan', 3);

INSERT INTO categories
  (category)
VALUES
  ('For Sale'),
  ('Jobs'),
  ('Housing'),
  ('Services');

INSERT INTO posts
  (user_id,title,description,region,category,location)
VALUES
  (1,'Chicken for sale!', 'Got a whole chicken for sale you can make nuggets out of em. $100 OBO', 1, 1, 'San Francisco'),
  (2,'Programmer needed!', 'Need a web developer asap. Will pay $5 an hour! That is not a typo.', 2, 2, 'ATL');