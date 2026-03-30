-- ============================================
-- Music DB Schema
-- PostgreSQL database for a music streaming app
-- ============================================

-- Table: singers
CREATE TABLE singers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    birth_date DATE
);

-- Table: albums (each album belongs to one singer)
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    singer_id INTEGER REFERENCES singers(id),
    name TEXT NOT NULL,
    release_date DATE
);

-- Table: songs (each song belongs to one album)
CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    album_id INTEGER REFERENCES albums(id),
    name TEXT NOT NULL,
    genre TEXT
);

-- Table: users (people using the app)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Table: playlists (each playlist belongs to one user)
CREATE TABLE playlists (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Table: playlist_songs (junction table between playlists and songs)
CREATE TABLE playlist_songs (
    playlist_id INTEGER NOT NULL REFERENCES playlists(id) ON DELETE CASCADE,
    song_id INTEGER NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
    added_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (playlist_id, song_id)
);

-- ============================================
-- Sample Data
-- ============================================

INSERT INTO singers (name, country, birth_date) VALUES
('Adele', 'UK', '1988-05-05'),
('Ed Sheeran', 'UK', '1991-02-17'),
('Drake', 'Canada', '1986-10-24'),
('Taylor Swift', 'USA', '1989-12-13'),
('Shakira', 'Colombia', '1977-02-02'),
('Eminem', 'USA', '1972-10-17'),
('BTS', 'South Korea', '2013-06-13'),
('Rihanna', 'Barbados', '1988-02-20');

INSERT INTO albums (singer_id, name, release_date) VALUES
(1, '21', '2011-01-24'),
(1, '25', '2015-11-20'),
(2, 'Divide', '2017-03-03'),
(3, 'Scorpion', '2018-06-29'),
(4, '1989', '2014-10-27'),
(6, 'The Eminem Show', '2002-05-26'),
(8, 'Anti', '2016-01-28');

INSERT INTO songs (album_id, name, genre) VALUES
(1, 'Rolling in the Deep', 'Pop'),
(1, 'Someone Like You', 'Pop'),
(2, 'Hello', 'Pop'),
(3, 'Shape of You', 'Pop'),
(3, 'Perfect', 'Pop'),
(4, 'Gods Plan', 'Hip Hop'),
(4, 'In My Feelings', 'Hip Hop'),
(5, 'Shake It Off', 'Pop'),
(5, 'Blank Space', 'Pop'),
(6, 'Without Me', 'Rap'),
(6, 'Lose Yourself', 'Rap'),
(7, 'Work', 'R&B'),
(7, 'Needed Me', 'R&B');

INSERT INTO users (username, email) VALUES
('alice', 'alice@example.com'),
('bob', 'bob@example.com'),
('charlie', 'charlie@example.com');

INSERT INTO playlists (user_id, name) VALUES
(1, 'Chill Vibes'),
(2, 'Road Trip Mix');

INSERT INTO playlist_songs (playlist_id, song_id) VALUES
(1, 1),  -- Chill Vibes: Rolling in the Deep
(1, 3),  -- Chill Vibes: Hello
(2, 1),  -- Road Trip Mix: Rolling in the Deep
(2, 2);  -- Road Trip Mix: Someone Like You
