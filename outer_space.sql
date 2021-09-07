-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies
  );

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER NOT NULL REFERENCES planets
);



INSERT INTO galaxies(name)
VALUES 
('milky way'),
('andromeda');

INSERT INTO stars (name, galaxy_id)
VALUES 
('sol', 1),
('proxima centari',1),
('gliese 876',1);


INSERT INTO planets
  (name, orbits_around, orbital_period_in_years)
VALUES
  ('Earth', 1,1),
  ('Mars', 1, 1.5),
  ('Venus', 1,1.7),
  ('Neptune', 1,1),
  ('jupitar', 1,1),
  ('Proxima Centauri b', 2,1),
  ('Gliese 876 b', 3,1);

INSERT INTO moons (name, planet_id)
VALUES 
('moon', 1),
('titan', 4),
('phobos', 2);