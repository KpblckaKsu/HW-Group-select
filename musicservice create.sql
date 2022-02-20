create table if not exists singer (
	id serial primary key, 
	name_singer varchar(40) unique not null,
	genre varchar(40) unique not null
);

create table if not exists album (
	id serial primary key, 
	title_track text not null,
	year_of_issue integer,
	id_singer integer references singer(id)
);

create table if not exists tracks (
	id serial primary key,
	title_track text not null,
	duration_track varchar(40),
	id_album integer references album(id)
);

create table if not exists genre (
	id serial primary key, 
	title_genre varchar(40) not null references singer(genre)
);

alter table album rename title_track to title_album;

ALTER TABLE genre DROP CONSTRAINT genre_title_genre_fkey;

ALTER TABLE singer ALTER COLUMN genre TYPE integer USING (genre::integer);

ALTER TABLE singer
   ADD CONSTRAINT fk FOREIGN KEY (genre)
      REFERENCES genre(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE tracks ALTER COLUMN duration_track TYPE integer USING (duration_track::integer);
