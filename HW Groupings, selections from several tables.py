import sqlalchemy
from pprint import pprint

engine = sqlalchemy.create_engine('postgresql://ksenia:123456@localhost:5432/musicservise')

connection = engine.connect()

# название и год выхода альбомов, вышедших в 2018 году

# количество исполнителей в каждом жанре
print(connection.execute("""
SELECT genre, COUNT(*) 
    FROM singergenre sg
    JOIN genre g ON sg.genre_id = g.id
    JOIN singer s ON sg.singer_id = s.id
    GROUP BY genre;
""").fetchall())

# количество треков, вошедших в альбомы 2019-2020 годов
print(connection.execute("""
SELECT title_album, COUNT(title_track) 
    FROM album a JOIN tracks t
    ON a.id = t.id_album
    WHERE year_of_issue BETWEEN 2018 AND 2020
    GROUP BY title_album;
""").fetchall())

# средняя продолжительность треков по каждому альбому
print(connection.execute("""
SELECT title_album, ROUND(AVG(duration_track), 2)
    FROM album a JOIN tracks t
    ON a.id = t.id_album 
    GROUP BY title_album;
""").fetchall())

# все исполнители, которые не выпустили альбомы в 2020 году
print(connection.execute("""
SELECT name_singer FROM singer 
    WHERE name_singer NOT IN
        (SELECT name_singer
        FROM singeralbum sa
        JOIN singer s ON sa.singer_id = s.id
        JOIN album a ON sa.album_id = a.id
        WHERE year_of_issue = 1969);
""").fetchall())

# названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
print(connection.execute("""
SELECT title_collection, title_track
    FROM digest_album da
    JOIN collection c ON da.collection_id = c.id
    JOIN tracks t ON da.track_id = t.id
    JOIN album a ON t.id_album = a.id
    JOIN singeralbum sa ON a.id = sa.album_id
    JOIN singer s ON sa.singer_id = s.id 
    WHERE name_singer = 'Madonna'
""").fetchall())

# название альбомов, в которых присутствуют исполнители более 1 жанра
print(connection.execute("""
SELECT title_album 
FROM singergenre sg
    JOIN genre g ON sg.genre_id = g.id
    JOIN singer s ON sg.singer_id = s.id
    JOIN singeralbum sa ON s.id = sa.singer_id
    JOIN album a ON sa.album_id = a.id
    GROUP BY title_album
    HAVING COUNT(genre) > 1;
""").fetchall())

# наименование треков, которые не входят в сборники
print(connection.execute("""
SELECT title_track FROM tracks
    WHERE title_track NOT IN
        (SELECT title_track  
        FROM tracks t
        JOIN digest_album da ON t.id = da.track_id
        JOIN collection c ON da.collection_id = c.id)
""").fetchall())

# исполнителя(-ей), написавшего самый короткий по продолжительности трек ( теоретически таких треков может быть несколько)
print(connection.execute("""
SELECT name_singer, duration_track
    FROM singer s
    JOIN singeralbum sa ON s.id = sa.singer_id
    JOIN album a ON sa.album_id = a.id
    JOIN tracks t ON a.id = t.id_album
    WHERE duration_track = 
        (SELECT MIN(duration_track) FROM tracks)
""").fetchall())

#название альбомов, содержащих наименьшее количество треков
print(connection.execute("""
SELECT title_album, COUNT(title_track)
    FROM album a
    JOIN tracks t ON a.id = t.id_album
    GROUP BY title_album
    HAVING COUNT(title_track) = (SELECT  COUNT(title_track) tt
            FROM album a
            JOIN tracks t ON a.id = t.id_album 
            GROUP BY title_album 
            ORDER BY tt 
            LIMIT 1)
""").fetchall())