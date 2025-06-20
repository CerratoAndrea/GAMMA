-- Autore: G.F.
-- TABELLA UTENTE
-- Crea tabella per memorizzare le informazioni utente
-- Contiene: ID utente (auto-incrementante), nome utente, email, password
create table utente (
	id_utente serial,      -- Chiave primaria, auto-incrementante
	username varchar(50) unique,  -- Campo nome utente univoco
	email varchar(50) unique,     -- Campo email univoco
	password varchar(50),         -- Password utente
	
	constraint utente_pk primary key (id_utente)
);

-- Autore: G.F.
--TABELLA LIBRO
-- Crea tabella per memorizzare le informazioni dei libri
-- Contiene: ID libro, autore, titolo, descrizione, immagine copertina, pagine, anno di pubblicazione
create table book (
	id_book serial,        -- Chiave primaria, auto-incrementante
	autore varchar(50),    -- Autore del libro
	titolo varchar(50),    -- Titolo del libro
	descrizione text,      -- Descrizione del libro
	copertina varchar,     -- Percorso/URL immagine copertina
	pagine int,           -- Numero di pagine
	anno_pubblicazione varchar(100),  -- Anno di pubblicazione
	
	constraint book_pk primary key (id_book)
);

-- Autore: G.F.
--TABELLA GENERE
-- Crea tabella per i generi dei libri
-- Contiene: ID genere e nome
create table genere (
	id_genere serial,      -- Chiave primaria, auto-incrementante
	nome_genere varchar(50),  -- Nome del genere
	
	constraint genere_pk primary key (id_genere)
);

-- Autore: G.F.
--TABELLA CHALLENGE 
-- Crea tabella per le sfide di lettura
-- Contiene: ID sfida, descrizione, titolo, date di inizio e fine
create table challenge (
	id_challenge serial,   -- Chiave primaria, auto-incrementante
	descrizione text,      -- Descrizione della sfida
	titolo varchar(100),   -- Titolo della sfida
	data_inizio date default current_date,  -- Data inizio, predefinita a data corrente
	data_fine date default current_date,    -- Data fine, predefinita a data corrente
	
	constraint challenge_pk primary key (id_challenge)
);

-- Autore: G.F.
--TABELLA UTENTE_CHALLENGE
-- Tabella di collegamento tra utenti e sfide
-- Contiene: chiavi esterne ID utente e ID sfida
create table utente_challenge (
	id_utente int,        -- Chiave esterna per utenti
	id_challenge int,     -- Chiave esterna per sfide
	
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente),
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge)
);

-- Autore: G.F.
--TABELLA CHALLENGE_LIBRO
-- Tabella di collegamento tra sfide e libri
-- Contiene: chiavi esterne ID sfida e ID libro
create table challenge_book(
	id_challenge int,     -- Chiave esterna per sfide
	id_book int,         -- Chiave esterna per libri
	
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge),
	constraint book_fk foreign key (id_book)
		references book(id_book)
);

-- Autore: G.F.
--TABELLA BOOK_GENERE
-- Tabella di collegamento tra libri e generi
-- Contiene: chiavi esterne ID libro e ID genere
create table book_genere(
	id_book int,         -- Chiave esterna per libri
	id_genere int,       -- Chiave esterna per generi

	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint genere_fk foreign key (id_genere)
		references genere(id_genere)
);

-- Autore: G.F.
--TABELLA UTENTE_BOOK
-- Tabella di collegamento tra utenti e libri
-- Contiene: ID utente, ID libro e stato di lettura
create table utente_book (
	id_utente int,       -- Chiave esterna per utenti
	id_book int,         -- Chiave esterna per libri
	letto boolean,       -- Indica se il libro è stato letto
	
	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente)
);

-- Autore: G.F.
--TABELLA CHALLENGE_BOOK_UTENTE
-- Tabella di collegamento tra sfide, libri e utenti
-- Contiene: chiavi esterne ID sfida, ID libro e ID utente
create table challenge_book_utente(
	id_challenge int,    -- Chiave esterna per sfide
	id_book int,        -- Chiave esterna per libri
	id_utente int,      -- Chiave esterna per utenti
	
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente),
	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge)
);
