-- Crea la tabella users per memorizzare le informazioni degli utenti
-- id: chiave primaria auto-incrementante
-- username: nome visualizzato dell'utente (max 200 caratteri)
-- password: password crittografata (max 100 caratteri)
-- email: indirizzo email dell'utente (max 200 caratteri)
CREATE TABLE users (
    id SERIAL,
    username VARCHAR(200),
    password VARCHAR(100),
	email VARCHAR(200),
    CONSTRAINT users_pk PRIMARY KEY (id)
);

-- Crea la tabella books per memorizzare le informazioni dei libri
-- id: chiave primaria auto-incrementante
-- title: titolo del libro (max 200 caratteri)
-- author: nome dell'autore del libro (max 100 caratteri)
-- image: percorso/url dell'immagine di copertina (max 100 caratteri)
-- summary: descrizione/riassunto del libro (max 2000 caratteri)
-- year: anno di pubblicazione (max 100 caratteri)
-- pages: numero di pagine del libro
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

-- Crea la tabella di giunzione per tracciare le relazioni utente-libro
-- user_id: chiave esterna che fa riferimento alla tabella users
-- book_id: chiave esterna che fa riferimento alla tabella books
-- read: flag booleano che indica se l'utente ha letto il libro
-- Chiave primaria composta da user_id e book_id
CREATE TABLE users_books (
    user_id integer,
	book_id integer,
	read boolean,
    CONSTRAINT users_books_pk PRIMARY KEY (user_id, book_id),
	CONSTRAINT users_books_fk1 FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT users_books_fk2 FOREIGN KEY  (book_id) REFERENCES books (id)
);