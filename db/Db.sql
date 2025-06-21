Drop table IF EXISTS challenge_book_user CASCADE;
Drop table IF EXISTS challenge_book CASCADE;
Drop table IF EXISTS user_challenge CASCADE;
Drop table IF EXISTS challenges CASCADE;
Drop table IF EXISTS users_books CASCADE;
Drop table IF EXISTS books CASCADE;
Drop table IF EXISTS users CASCADE;



CREATE TABLE users (
    id SERIAL,
    username VARCHAR(200),
    password VARCHAR(100),
	email VARCHAR(200),
    CONSTRAINT users_pk PRIMARY KEY (id)
);


CREATE TABLE books (
    id SERIAL,
    title VARCHAR(200),
    author VARCHAR(100),
	image VARCHAR(100),
	summary VARCHAR(2000),
	year VARCHAR(100),
	pages integer,
    CONSTRAINT books_pk PRIMARY KEY (id)
);


CREATE TABLE users_books (
    user_id integer,
	book_id integer,
	read boolean,
    CONSTRAINT users_books_pk PRIMARY KEY (user_id, book_id),
	CONSTRAINT users_books_fk1 FOREIGN KEY (user_id) REFERENCES users (id) on DELETE CASCADE,
	CONSTRAINT users_books_fk2 FOREIGN KEY  (book_id) REFERENCES books (id) on DELETE CASCADE
);

create table challenges (
	id serial,   -- Chiave primaria, auto-incrementante
	description text,      -- Descrizione della sfida
	title varchar(100),   -- Titolo della sfida
	start_date date default current_date,  -- Data inizio, predefinita a data corrente
	end_date date,    
	
	constraint challenge_pk primary key (id)
);

create table user_challenge (
	user_id int,        -- Chiave esterna per utenti
	challenge_id int,     -- Chiave esterna per sfide
	
	constraint user_challenge_fk1 foreign key (user_id)
		references users(id) on DELETE CASCADE,
	constraint user_challenge_fk2 foreign key (challenge_id)
		references challenges(id) on DELETE CASCADE,
	CONSTRAINT user_challenge_pk PRIMARY key (user_id ,challenge_id)
);


create table challenge_book(
	challenge_id int,     -- Chiave esterna per sfide
	book_id int,         -- Chiave esterna per libri
	
	constraint challenge_fk foreign key (challenge_id)
		references challenges(id) on DELETE CASCADE,
	constraint book_fk foreign key (book_id)
		references books(id) on DELETE CASCADE,
	CONSTRAINT challenge_book_pk PRIMARY key (challenge_id, book_id)
);

create table challenge_book_user(
	challenge_id int,    -- Chiave esterna per sfide
	book_id int,        -- Chiave esterna per libri
	user_id int,      -- Chiave esterna per utenti
	
	constraint challenge_book_user_fk1 foreign key (user_id, challenge_id)
		references user_challenge(user_id, challenge_id) on DELETE CASCADE,
	constraint challenge_book_user_fk2 foreign key (book_id, challenge_id)
		references challenge_book(book_id, challenge_id) on DELETE CASCADE,
	CONSTRAINT challenge_book_user_pk PRIMARY key (challenge_id, book_id, user_id)
);


