INSERT INTO artist(name)
VALUES
	('Beyonce'),
	('Drake'),
	('Andrea Bocelli'),
	('Adele'),
	('Lana Del Rey'),
	('Cardi B'),
	('The Beatles'),
	('Michael Jackson');
	
INSERT INTO genre(name)
VALUES
	('pop'),
	('soul'),
	('hip-hop'),
	('rock'),
	('opera'),
	('R&B');

INSERT INTO genre_artist(artist_id, genre_id)
VALUES
	(1,1),
	(1,2),
	(1,6),
	(2,3),
	(2,6),
	(3,5),
	(4,1),
	(4,2),
	(5,1),
	(5,2),
	(6,2),
	(6,6),
	(7,4),
	(8,1);

INSERT INTO album(name, release_year)
VALUES
	('Lemonade', 2016),
	('Scorpion', 2018),
	('Passione', 2013),
	('25', 2015),
	('Last for Life', 2017),
	('Invasion of Privacy', 2018),
	('Let it Be', 1970),
	('Dangerous', 1991),
	('Norman Fucking Rockwell!', 2019);

INSERT INTO track(name, duration, album_id)
VALUES
	('Hold Up', 221, 1),
	('Pray You Catch Me', 196, 1),
	('Survival', 136, 2),
	('Nonstop', 238, 2),
	('Perfidia', 248, 3),
	('Champagne', 254, 3),
	('Hello', 295, 4),
	('Send My Love', 223, 4),
	('Love', 272, 5),
	('Cherry', 180, 5),
	('Get Up 10', 231, 6),
	('Drip', 263, 6),
	('Two of Us', 216, 7),
	('Dig a Pony', 234, 7),
	('Jam', 339, 8),
	('Why You Wanna Trip on Me', 324, 8),
	('Bartender', 263, 9),
	('Happiness Is a Butterfly', 272, 9);

INSERT INTO album_artist(album_id, artist_id)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,5);

INSERT INTO collection(name, release_year)
VALUES
	('Euphoria Soundtracks', 2020),
	('Gym Pump', 2019),
	('Serata Sanremo', 2022),
	('Pay Close Attention: XL Recordings', 2016),
	('Love Songs', 2018),
	('Still Over It', 2021),
	('Discover More Classic Rock', 2020),
	('Soul Legends', 2021);
	

	
INSERT INTO collection_track(collection_id, track_id)
VALUES 
	(1,1),
	(1,4),
	(2,3),
	(3,5),
	(4,7),
	(5,7),
	(6,12),
	(7,13),
	(8,16);