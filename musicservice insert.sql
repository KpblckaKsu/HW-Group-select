INSERT INTO genre (title_genre) VALUES
	('rock'),
	('chanson'),
	('pop'),
	('blues'),
	('jazz');

INSERT INTO singer (name_singer, genre) VALUES
    ('Agatha Christie', 'rock'),
    ('Jimi Hendrix', 'blues'),
    ('The Beatles', 'rock'),
    ('Mikhail Shufutinsky', 'chanson'),
    ('Zivert', 'pop'),
    ('Madonna', 'pop'),
    ('Louis Armstrong', 'jazz'),
    ('Francis Sinatra','jazz'); 

INSERT INTO album (title_album, year_of_issue) VALUES
    ('Opium', 1995),
    ('Woodstock', 1994),
    ('Yellow Submarine', 1969),
    ('Solo', 2005),
    ('Siyai', 2018),
    ('Like a Virgin', 1984),
    ('Hello, dolly', 1964),
    ('Christmas Songs', 1948),
    ('Help!', 1965);
 
INSERT INTO tracks (title_track, duration_track, id_album) VALUES
    ('Абордаж', 257, 17),
    ('Черная луна', 239, 17),
    ('Fire', 233, 18),
    ('Yellow Submarine', 160, 19),
    ('Pepperland', 144, 19),
    ('Solo', 243, 20),
    ('Zanovo', 247, 20),
    ('Сияй', 206, 21),
    ('Мой океан', 204, 21),
    ('Angel', 236, 22),
    ('Stay', 248, 22),
    ('Hello, dolly', 143, 23),
    ('Someday', 217, 23),
    ('White Christmas', 205, 24),
    ('Jingle Bells', 157, 24),
    ('Hey Bulldog', 197, 19),
    ('All You Need Is Love', 224, 19),
    ('Help!', 141, 25);

INSERT INTO collection (title_collection, year_of_issue) VALUES
    ('Избраное', 2005),
    ('Best', 2000),
    ('All hits', 1980),
    ('Лучшее', 2018),
    ('Remix', 2020),
    ('Hits', 1984),
    ('Favorites', 1985),
    ('Best of the best', 1960);

INSERT INTO singergenre (singer_id, genre_id) VALUES
    (17, 11),
    (18, 14),
    (19, 11),
    (19, 13),
    (20, 12),
    (21, 13),
    (22, 13),
    (23, 15),
    (24, 15);

INSERT INTO singeralbum (singer_id, album_id) VALUES
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (18, 25);

INSERT INTO digest_album (collection_id, track_id) VALUES
    (17, 97),
    (18, 99),
    (19, 101),
    (20, 104),
    (21, 105),
    (22, 107),
    (23, 110),
    (24, 111);
   

