DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    short_name TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team_one_id INTEGER NOT NULL REFERENCES teams,
    team_two_id INTEGER NOT NULL REFERENCES teams,
    referee_id INTEGER NOT NULL REFERENCES referees,
    m_date TEXT NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players,
    team_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE standings (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL REFERENCES teams
);

INSERT INTO teams (name, short_name) VALUES 
('United States of America', 'USA'),
('Canada', 'CND'),
('Mexico', 'MX'),
('France', 'FRA'),
('United Kingdom', 'UK'),
('Argentina', 'ARG');


INSERT INTO players (first_name, last_name, team_id) VALUES 
('Bernardo', 'Narvaez', 1),
('Lionel', 'Messi', 6),
('Christaino', 'Ronaldo', 4),
('Raul', 'Jimenex', 3);

INSERT INTO referees (first_name,last_name)
VALUES
('Juan', 'Martinez'),
('Richard', 'Walls'),
('Jing', 'Lao');

INSERT INTO matches (team_one_id, team_two_id, referee_id, m_date)
VALUES
(1,3, 1, ('08-15-2021')),
(2,5,2, ('08-15-2021')),
(4,6,3, ('08-15-2021')),
(6,3,1, ('08-25-2021'));

INSERT INTO goals (player_id, team_id, match_id)
VALUES
(2,6,4),
(1,1,1);


INSERT INTO standings (team_id)
VALUES
(6),
(5),
(3),
(4),
(1),
(2);