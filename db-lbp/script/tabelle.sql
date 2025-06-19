-- Author: G.F.
-- TABELLA UTENTE
-- Creates table for storing user information
-- Contains: user ID (auto-incrementing), username, email, password
create table utente (
	id_utente serial,      -- Primary key, auto-incrementing
	username varchar(50) unique,  -- Unique username field
	email varchar(50) unique,     -- Unique email field  
	password varchar(50),         -- User password
	
	constraint utente_pk primary key (id_utente)
);

-- Author: G.F.
--TABELLA LIBRO
-- Creates table for storing book information
-- Contains: book ID, author, title, description, cover image, pages, publication year
create table book (
	id_book serial,        -- Primary key, auto-incrementing
	autore varchar(50),    -- Book author
	titolo varchar(50),    -- Book title
	descrizione text,      -- Book description
	copertina varchar,     -- Cover image path/URL
	pagine int,           -- Number of pages
	anno_pubblicazione varchar(100),  -- Publication year
	
	constraint book_pk primary key (id_book)
);

-- Author: G.F.
--TABELLA GENERE
-- Creates table for book genres
-- Contains: genre ID and name
create table genere (
	id_genere serial,      -- Primary key, auto-incrementing
	nome_genere varchar(50),  -- Genre name
	
	constraint genere_pk primary key (id_genere)
);

-- Author: G.F.
--TABELLA CHALLENGE 
-- Creates table for reading challenges
-- Contains: challenge ID, description, title, start and end dates
create table challenge (
	id_challenge serial,   -- Primary key, auto-incrementing
	descrizione text,      -- Challenge description
	titolo varchar(100),   -- Challenge title
	data_inizio date default current_date,  -- Start date, defaults to current
	data_fine date default current_date,    -- End date, defaults to current
	
	constraint challenge_pk primary key (id_challenge)
);

-- Author: G.F.
--TABELLA UTENTE_CHALLENGE
-- Junction table linking users to challenges
-- Contains: user ID and challenge ID foreign keys
create table utente_challenge (
	id_utente int,        -- Foreign key to users
	id_challenge int,     -- Foreign key to challenges
	
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente),
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge)
);

-- Author: G.F.
--TABELLA CHALLENGE_LIBRO
-- Junction table linking challenges to books
-- Contains: challenge ID and book ID foreign keys
create table challenge_book(
	id_challenge int,     -- Foreign key to challenges
	id_book int,         -- Foreign key to books
	
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge),
	constraint book_fk foreign key (id_book)
		references book(id_book)
);

-- Author: G.F.
--TABELLA BOOK_GENERE
-- Junction table linking books to genres
-- Contains: book ID and genre ID foreign keys
create table book_genere(
	id_book int,         -- Foreign key to books
	id_genere int,       -- Foreign key to genres

	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint genere_fk foreign key (id_genere)
		references genere(id_genere)
);

-- Author: G.F.
--TABELLA UTENTE_BOOK
-- Junction table linking users to books
-- Contains: user ID, book ID and read status
create table utente_book (
	id_utente int,       -- Foreign key to users
	id_book int,         -- Foreign key to books
	letto boolean,       -- Indicates if book has been read
	
	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente)
);

-- Author: G.F.
--TABELLA CHALLLENGE_BOOK_UTENTE
-- Junction table linking challenges, books and users
-- Contains: challenge ID, book ID and user ID foreign keys
create table challenge_book_utente(
	id_challenge int,    -- Foreign key to challenges
	id_book int,        -- Foreign key to books
	id_utente int,      -- Foreign key to users
	
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente),
	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge)
);
