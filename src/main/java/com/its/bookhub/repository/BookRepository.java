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
	 	String query = "SELECT * FROM BOOKS WHERE ID = ?";		 	
	 	Book book = jdbcTemplate.queryForObject(query,
                new BookMapper(),
                new Object[]{id});
	 	return book;
	}
	
	public Book findByTitle(String title) {
	 	String query = "SELECT * FROM BOOKS WHERE TITLE = ?";		 	
	 	Book book = jdbcTemplate.queryForObject(query,
                new BookMapper(),
                new Object[]{title});
	 	return book;
	} 
	
	public Book findByAuthor(String author) {
	 	String query = "SELECT * FROM BOOKS WHERE AUTHOR = ?";		 	
	 	Book book = jdbcTemplate.queryForObject(query,
                new BookMapper(),
                new Object[]{author});
	 	return book;
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
