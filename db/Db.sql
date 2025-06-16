
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
	CONSTRAINT users_books_fk1 FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT users_books_fk2 FOREIGN KEY  (book_id) REFERENCES books (id)
);