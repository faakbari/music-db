-- ============================================
-- Music DB - Practice Queries
-- ============================================

-- Query 1: Show all songs with their album name and singer name
SELECT so.name AS song, a.name AS album, si.name AS singer
FROM songs so
JOIN albums a ON so.album_id = a.id
JOIN singers si ON a.singer_id = si.id;

-- Query 2: Each singer and how many songs they have, ordered from most to least
SELECT si.name AS singer, COUNT(so.id) AS song_count
FROM songs so
JOIN albums a ON so.album_id = a.id
JOIN singers si ON a.singer_id = si.id
GROUP BY si.name
ORDER BY song_count DESC;

-- Query 3: Each playlist with its owner username and total song count
SELECT users.username, playlists.name AS playlist, COUNT(playlist_songs.playlist_id) AS song_count
FROM users
JOIN playlists ON users.id = playlists.user_id
JOIN playlist_songs ON playlists.id = playlist_songs.playlist_id
GROUP BY playlists.name, users.username;

-- Query 4: All songs that have never been added to any playlist
SELECT s.name AS song
FROM songs s
WHERE s.id NOT IN (
    SELECT ps.song_id FROM playlist_songs ps
);

-- Query 5: The most popular song (added to most playlists)
SELECT so.name AS song, COUNT(ps.song_id) AS playlist_count
FROM songs so
JOIN playlist_songs ps ON so.id = ps.song_id
GROUP BY so.name
ORDER BY playlist_count DESC
LIMIT 1;

-- Query 6: All users who have NOT created any playlist
SELECT users.username
FROM users
WHERE users.id NOT IN (
    SELECT user_id FROM playlists
);

-- Query 7: Each genre and its song count (only genres with more than 1 song)
SELECT genre, COUNT(*) AS song_count
FROM songs
GROUP BY genre
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Query 8: Each user with their total playlists and total songs
SELECT users.username,
       COUNT(DISTINCT ps.id) AS playlist_count,
       COUNT(ps_s.song_id) AS song_count
FROM users
JOIN playlists ps ON users.id = ps.user_id
JOIN playlist_songs ps_s ON ps.id = ps_s.playlist_id
GROUP BY users.username;

-- Query 9: The singer who has the most total songs across all albums
SELECT singers.name AS singer, COUNT(songs.id) AS song_count
FROM singers
JOIN albums ON singers.id = albums.singer_id
JOIN songs ON albums.id = songs.album_id
GROUP BY singers.name
ORDER BY COUNT(songs.id) DESC
LIMIT 1;

-- Query 10: All singers who have at least one Pop song
SELECT singers.name AS singer
FROM singers
JOIN albums ON singers.id = albums.singer_id
JOIN songs ON albums.id = songs.album_id
WHERE songs.genre = 'Pop'
GROUP BY singers.name;
