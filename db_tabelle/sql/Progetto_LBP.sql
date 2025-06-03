CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Users (user_id, name, email, password_hash, created_at) 
VALUES
(1, 'Alice Smith', 'alice@example.com', 'hash1', '2023-01-01 10:00:00'),
(2, 'Bob Johnson', 'bob@example.com', 'hash2', '2023-02-15 12:30:00'),
(3, 'Charlie Brown', 'charlie@example.com', 'hash3', '2023-03-20 09:45:00'),
(4, 'Diana Prince', 'diana@example.com', 'hash4', '2023-04-10 14:20:00'),
(5, 'Evan Wright', 'evan@example.com', 'hash5', '2023-05-05 16:50:00');


