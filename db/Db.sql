-- Create users table to store user information
-- id: auto-incrementing primary key
-- username: user's display name (max 200 chars)
-- password: hashed password (max 100 chars)
-- email: user's email address (max 200 chars)
CREATE TABLE users (
    id SERIAL,
    username VARCHAR(200),
    password VARCHAR(100),
	email VARCHAR(200),
    CONSTRAINT users_pk PRIMARY KEY (id)
);

-- Create books table to store book information
-- id: auto-incrementing primary key
-- title: book title (max 200 chars)
-- author: book author name (max 100 chars)
-- image: path/url to book cover image (max 100 chars)
-- summary: book description/summary (max 2000 chars)
-- year: publication year (max 100 chars)
-- pages: number of pages in the book
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

-- Create junction table to track user-book relationships
-- user_id: foreign key referencing users table
-- book_id: foreign key referencing books table
-- read: boolean flag indicating if user has read the book
-- Composite primary key of user_id and book_id
CREATE TABLE users_books (
    user_id integer,
	book_id integer,
	read boolean,
    CONSTRAINT users_books_pk PRIMARY KEY (user_id, book_id),
	CONSTRAINT users_books_fk1 FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT users_books_fk2 FOREIGN KEY  (book_id) REFERENCES books (id)
);