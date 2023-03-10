SELECT genre.name, COUNT(artist_id) FROM genre_artist ga
JOIN genre ON ga.genre_id = genre.id
JOIN artist a ON a.id = ga.artist_id 
GROUP BY genre.name;

SELECT COUNT(DISTINCT t.name) FROM track t 
JOIN album a ON t.album_id = a.id 
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT album.name, AVG(duration) FROM track t 
JOIN album ON t.album_id = album.id 
GROUP BY album.name;

SELECT a.name FROM album_artist aa 
JOIN artist a ON aa.album_id = a.id 
JOIN album al ON aa.album_id = al.id 
WHERE release_year != '2020'
GROUP BY a.name;

SELECT c.name FROM collection_track ct
JOIN collection c ON c.id = ct.collection_id
JOIN track t ON ct.track_id = t.id
JOIN album al ON t.album_id  = al.id 
JOIN album_artist aa ON al.id = aa.album_id 
JOIN artist a ON a.id = aa.artist_id 
WHERE a.name = 'Beyonce';

SELECT al.name FROM album_artist aa 
JOIN album al ON aa.album_id = al.id 
JOIN artist a ON a.id = aa.artist_id 
JOIN genre_artist ga ON a.id = ga.artist_id 
JOIN genre g ON g.id = ga.genre_id 
GROUP BY al.name 
HAVING COUNT(ga.genre_id) >= 2;

SELECT t.name FROM track t 
LEFT OUTER JOIN collection_track ct ON ct.track_id = t.id
LEFT OUTER JOIN collection c ON ct.collection_id = c.id
WHERE ct.collection_id IS NULL; 

SELECT a.name FROM artist a 
JOIN album_artist aa ON aa.artist_id = a.id 
JOIN album al ON al.id = aa.album_id 
JOIN track t ON t.album_id = al.id 
WHERE t.duration = (SELECT MIN(duration) FROM track);

SELECT al.name, COUNT(*) FROM track t
JOIN album al ON al.id = t.album_id 
GROUP BY al.name
HAVING COUNT(*) = (
	SELECT COUNT(*) FROM track t
	JOIN album al ON al.id = t.album_id
	GROUP BY al.name
	ORDER BY COUNT(*)
	LIMIT 1)