DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(40),
  city VARCHAR(50)
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  birthday DATE,
  height INT,
  "weight" INT,
  team INT REFERENCES teams (id)
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(40)
);

CREATE TABLE season
(
  id SERIAL PRIMARY KEY,
  "start" DATE,
  "end" DATE
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  home INT REFERENCES teams (id),
  away INT REFERENCES teams (id),
  "location" TEXT,
  "date" DATE,
  season INT REFERENCES season (id),
  referee INT REFERENCES referees (id)
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  team INT REFERENCES teams (id),
  result VARCHAR(4)
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player INT REFERENCES players (id),
  match INT REFERENCES matches (id)
);

