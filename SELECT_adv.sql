--Количество исполнителей в каждом жанре.
SELECT g.name, COUNT(artist_id) FROM genre g
JOIN genre_artist ga ON g.id = ga.genre_id
JOIN artist a ON a.id = ga.artist_id 
GROUP BY g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(DISTINCT t.name) FROM track t 
JOIN album a ON t.album_id = a.id 
WHERE a.release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT album.name, AVG(duration) FROM track t 
JOIN album ON t.album_id = album.id 
GROUP BY album.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT a.name FROM artist a 
WHERE a.name NOT IN (
	SELECT a.name FROM artist a
	JOIN album_artist aa ON a.id = aa.album_id
	JOIN album al ON al.id = aa.album_id
	WHERE release_year = 2020
	);

--Названия сборников, в которых присутствует конкретный исполнитель (Beyonce).
SELECT c.name FROM collection_track ct
JOIN collection c ON c.id = ct.collection_id
JOIN track t ON ct.track_id = t.id
JOIN album al ON t.album_id  = al.id 
JOIN album_artist aa ON al.id = aa.album_id 
JOIN artist a ON a.id = aa.artist_id 
WHERE a.name = 'Beyonce';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT al.name FROM album al
JOIN album_artist aa ON al.id = aa.album_id 
JOIN artist a ON a.id = aa.artist_id 
JOIN genre_artist ga ON ga.artist_id = a.id 
JOIN genre g ON g.id = ga.genre_id 
GROUP BY al.name, a.name 
HAVING COUNT(ga.genre_id) >= 2;

--Наименования треков, которые не входят в сборники.
SELECT t.name FROM track t 
LEFT OUTER JOIN collection_track ct ON ct.track_id = t.id
WHERE ct.collection_id IS NULL; 

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT a.name FROM artist a 
JOIN album_artist aa ON aa.artist_id = a.id 
JOIN album al ON al.id = aa.album_id 
JOIN track t ON t.album_id = al.id 
WHERE t.duration = (SELECT MIN(duration) FROM track);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT al.name, COUNT(*) FROM track t
JOIN album al ON al.id = t.album_id 
GROUP BY al.name
HAVING COUNT(*) = (
	SELECT COUNT(*) FROM track t
	JOIN album al ON al.id = t.album_id
	GROUP BY al.name
	ORDER BY COUNT(*)
	LIMIT 1)