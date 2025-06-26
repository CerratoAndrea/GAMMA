package com.its.bookhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.its.bookhub.mapper.BookDelatableMapper;
import com.its.bookhub.mapper.BookMapper;
import com.its.bookhub.mapper.UserBookMapper;
import com.its.bookhub.model.Book;

@Repository
public class BookRepository {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	public Book findById(long id) {
	 	String query = "SELECT * FROM BOOKS WHERE ID = ?";		 	
	 	Book book = jdbcTemplate.queryForObject(query,
                new BookMapper(),
                new Object[]{id});
	 	return book;
	}
	
	public List<Book> findAll(long id_utente) {
	 	String query = "SELECT * FROM books AS b left join (select book_id, read from users_books WHERE user_id = ?) AS ub ON b.id = ub.book_id";		 	
	 	List<Book> books = jdbcTemplate.query(query,
                                              new UserBookMapper(),
                                              new Object[]{id_utente});
	 	return books;
	}
	
	public List<Book> findAllDeletable() {
	 	String query = "select * from books left join challenge_book on id = book_id;";		 	
	 	List<Book> books = jdbcTemplate.query(query,
                                              new BookDelatableMapper(),
                                              new Object[] {});
	 	return books;
	}
	
	public List<Book> findByTitle(String title, long id_utente) {
		if(title == null) {
			return findAll(id_utente);
		}
		String query = "SELECT * FROM books AS b left join (select book_id, read from users_books WHERE user_id = ?) AS ub ON b.id = ub.book_id "+
                       "WHERE LOWER(b.TITLE) LIKE ?";	
	 	
	 	List<Book> books = jdbcTemplate.query(query,
                new UserBookMapper(),
	 			new Object[]{id_utente, "%" + title.toLowerCase() + "%"});
	 	
	 	return books;
	} 
	
	public List<Book> findByAuthor(String author, long id_utente) {
		if(author == null) {
			return findAll( id_utente);
		}
		String query = "SELECT * FROM books AS b left join (select book_id, read from users_books WHERE user_id = ?) AS ub ON b.id = ub.book_id "+
                       "WHERE LOWER(b.AUTHOR) LIKE ?";		 	
	 	List<Book> books = jdbcTemplate.query(query,
                new UserBookMapper(),
	 			new Object[]{id_utente, "%" + author.toLowerCase() + "%"});
	 	return books;
	} 
	
	public List<Book> findByAuthorAndTitle(String author, String title, Long id_utente) {
	 	String query = "SELECT * FROM books AS b left join (select book_id, read from users_books WHERE user_id = ?) AS ub ON b.id = ub.book_id "+
	                   "WHERE LOWER(b.AUTHOR) LIKE ? AND LOWER(b.TITLE) LIKE ?";		 	
	 	List<Book> books = jdbcTemplate.query(query,
                new UserBookMapper(),
	 			new Object[]{id_utente, "%" + author.toLowerCase() + "%", "%" + title.toLowerCase() + "%"});
	 	return books;
	} 
	
	public List<Book> findByUser(long id_utente) {
		
			String query = "SELECT * FROM books AS b join users_books AS ub ON b.id = ub.book_id WHERE ub.user_id = ?";	
		 	List<Book> books =  jdbcTemplate.query(query,
		 										   new UserBookMapper(),
		 										   new Object[]{id_utente});
		 	return books;
	} 
	
	public int countReadBooks(boolean read, Long userid) {
		
	 	String query = "SELECT COUNT(*) FROM USERS_BOOKS WHERE USER_ID = ?  AND READ = ?";	
	 	int books =  jdbcTemplate.queryForObject(query, Integer.class, new Object[]{userid, read});
	 	
	 	return books;
	} 
	
	/*public List<Book> findByGenre(Genre genres) {
		
	 	String query = "SELECT * FROM BOOKS_GENRES WHERE GENRE = ?";	
	 	List<Book> books =  jdbcTemplate.query(query,
	 										   new BookMapper());
	 	return books;
	} */
	
	public int insertBookReading(Long userId,Long bookId, Boolean read) {
	 	String query = "INSERT INTO users_books (user_id, book_id, read) VALUES (?, ?, ?)";
	 		return jdbcTemplate.update(query,
 				   userId, bookId, read );
        
	}
	public int removeBookReading(Long userId,Long bookId) {
	 	String query = "DELETE FROM users_books WHERE USER_ID = ? AND BOOK_ID = ?";
	 		return jdbcTemplate.update(query,
 				   userId, bookId);
        
	}
	public int updateBookReading(Long bookId, boolean read) {
		 String query = "UPDATE USERS_BOOKS SET READ = ? WHERE BOOK_ID = ?";
	     return jdbcTemplate.update(query,
	                                  read, bookId );
	 }
	
	public List<Book> getChallengeUserBooks(long id_utente, long ch_id) {
		
		String query = "SELECT * FROM BOOKS Inner JOIN challenge_book_user ON id = book_id "
				 				 + "WHERE challenge_id = ? and user_id = ?";
	 	List<Book> books =  jdbcTemplate.query(query,
	 										   new BookMapper(),
	 										   new Object[]{ch_id, id_utente});
	 	return books;
} 
}
