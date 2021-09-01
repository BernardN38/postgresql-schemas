DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;



CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    pref_region TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    region TEXT NOT NULL,
    price INTEGER NOT NULL
);

CREATE TABLE listings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users,
    post_id INTEGER NOT NULL REFERENCES posts,
    category_id INTEGER NOT NULL REFERENCES categories
);


INSERT INTO users (username, pref_region, password) VALUES
('bernard_n', 'california', 'iamironman'),
('john_smith', 'texas', 'itsclobberingtime');

INSERT INTO categories (name) VALUES 
('social'),
('goods'),
('services');

INSERT INTO posts (user_id, title, content, region, price) VALUES 
(1, 'sale of car', 'i am selling this red chevy malibu, one owner, 70k miles', 'texas', 9000),
(2, 'residential cleaning services', 'best cleaning services in town', 'calidornia', 30);

INSERT INTO  listings (user_id, post_id, category_id) VALUES 
(1,1,2),
(2,2,3);
