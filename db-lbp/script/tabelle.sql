--TABELLA UTENTE
create table utente (
	id_utente serial,
	username varchar(50) unique,
	email varchar(50) unique,
	password varchar(50),
	
	constraint utente_pk primary key (id_utente)
);


--TABELLA LIBRO
create table book (
	id_book serial,
	autore varchar(50),
	titolo varchar(50),
	descrizione text,
	copertina varchar,
	pagine int,
	anno_pubblicazione varchar(100),
	
	constraint book_pk primary key (id_book)
);


--TABELLA GENERE
create table genere (
	id_genere serial,
	nome_genere varchar(50),
	
	constraint genere_pk primary key (id_genere)
);


--TABELLA CHALLENGE 
create table challenge (
	id_challenge serial,
	descrizione text,
	titolo varchar(100),
	data_inizio date default current_date,
	data_fine date default current_date,
	
	
	constraint challenge_pk primary key (id_challenge)
);


--TABELLA UTENTE_CHALLENGE
create table utente_challenge (
	id_utente int,
	id_challenge int,
	
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente),
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge)
);


--TABELLA CHALLENGE_LIBRO
create table challenge_book(
	id_challenge int,
	id_book int,
	
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge),
	constraint book_fk foreign key (id_book)
		references book(id_book)
);


--TABELLA BOOK_GENERE
create table book_genere(
	id_book int,
	id_genere int,

	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint genere_fk foreign key (id_genere)
		references genere(id_genere)
);


--TABELLA UTENTE_BOOK
create table utente_book (
	id_utente int,
	id_book int,
	letto boolean,
	
	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente)
);


--TABELLA CHALLLENGE_BOOK_UTENTE
create table challenge_book_utente(
	id_challenge int,
	id_book int,
	id_utente int,
	
	constraint utente_fk foreign key (id_utente)
		references utente(id_utente),
	constraint book_fk foreign key (id_book)
		references book(id_book),
	constraint challenge_fk foreign key (id_challenge)
		references challenge(id_challenge)
);


