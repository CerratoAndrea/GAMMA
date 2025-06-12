package com.its.bookhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.its.bookhub.mapper.BookMapper;
import com.its.bookhub.model.Book;
import com.its.bookhub.model.Genre;

@Repository
public class BookRepository {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	public List<Book> findAll() {
	 	String query = "SELECT * FROM BOOKS";		 	
	 	List<Book> books = jdbcTemplate.query(query,
                                              new BookMapper());
	 	return books;
	}
	
	public Book findById(long id) {
	 	String query = "SELECT * FROM books WHERE ID = ?";		 	
	 	Book book = jdbcTemplate.queryForObject(query,
                new BookMapper(),
                new Object[]{id});
	 	return book;
	}
	
	public List<Book> findByTitle(String title) {
		if(title == null) {
			return findAll();
		}
	 	String query = "SELECT * FROM BOOKS WHERE LOWER(TITLE) LIKE '%?%'";	
	 	
	 	List<Book> books = jdbcTemplate.query(query,
                new BookMapper(),
	 			new Object[]{title.toLowerCase()});
	 	
	 	return books;
	} 
	
	public List<Book> findByAuthor(String author) {
		if(author == null) {
			return findAll();
		}
	 	String query = "SELECT * FROM BOOKS WHERE LOWER(AUTHOR) LIKE '%?%'";		 	
	 	List<Book> books = jdbcTemplate.query(query,
                new BookMapper(),
	 			new Object[]{author.toLowerCase()});
	 	return books;
	} 
	
	public List<Book> findByAuthorAndTitle(String author, String title) {
	 	String query = "SELECT * FROM BOOKS WHERE LOWER(AUTHOR) LIKE '%?%' AND LOWER(TITLE) LIKE '%?%'";		 	
	 	List<Book> books = jdbcTemplate.query(query,
                new BookMapper(),
	 			new Object[]{author.toLowerCase(), title.toLowerCase()});
	 	return books;
	} 
	
	public List<Book> findByUser(long id_utente/* boolean read*/) {
		
			String query = "SELECT * FROM BOOKS WHERE ID_LIBRO IN (SELECT ID_LIBRO FROM UTENTE_LIBRO WHERE ID_UTENTE = ?)";	
		 	List<Book> books =  jdbcTemplate.query(query,
		 										   new BookMapper(),
		 										   new Object[]{id_utente});
		 	return books;
//			String query = "SELECT * FROM BOOKS WHERE ID_LIBRO IN (SELECT * FROM UTENTE_LIBRO WHERE LOWER(ID_UTENTE) = ? AND LETTO_INLETTURA = FALSE)";	
//		 	List<Book> books =  jdbcTemplate.query(query,
//		 										   new BookMapper());
//		 	return books;
	} 
	
	public int countReadBooks(boolean read, Long userid) {
		
	 	String query = "SELECT COUNT(*) FROM UTENTE_LIBRO WHERE ID_UTENTE = ?  AND LETTO_INLETTURA = ?";	
	 	int books =  jdbcTemplate.queryForObject(query, Integer.class, new Object[]{userid, read});
	 	
	 	return books;
	} 
	
	public List<Book> findByGenre(Genre genres) {
		
	 	String query = "SELECT * FROM BOOKS_GENRES WHERE GENRE = ?";	
	 	List<Book> books =  jdbcTemplate.query(query,
	 										   new BookMapper());
	 	return books;
	} 
	
	public int insertBookReading(Book book, boolean read) {
	 	String query = "INSERT INTO USER_BOOK(title, author, read) values(?,?,?)";
	 		return jdbcTemplate.update(query,
 				   book.getTitle(), book.getAuthor(), read );
        
	}
	public int updateBookReading(Book book, boolean read) {
		 String query = "UPDATE BOOK SET READ = ? WHERE ID = ?";
	     return jdbcTemplate.update(query,
	                                  read, book.getId() );
	 }
	
	
}
