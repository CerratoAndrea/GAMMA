package com.its.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.its.bookhub.model.Book;
import com.its.bookhub.repository.BookRepository;

@Service
public class BookService {
	
	@Autowired
	BookRepository bookRepository;
	
	public Book findById(long id) {
	 	return bookRepository.findById(id);
	}
	
	public List<Book> findAll(long id_utente) {
	 	return bookRepository.findAll(id_utente);
	}
	
	public List<Book> findAllDeletable(){
		return bookRepository.findAllDeletable();
	}
	
	public List<Book> findByTitle(String title, long id_utente) {	 	
	 	return bookRepository.findByTitle(title, id_utente);
	} 
	
	public List<Book> findByAuthor(String author, long id_utente) {
	 	return bookRepository.findByAuthor(author, id_utente);
	} 
	
	public List<Book> findByAuthorAndTitle(String author, String title, Long id_utente) {
	 	return bookRepository.findByAuthorAndTitle(author, title, id_utente);
	} 
	
	public List<Book> findByUser(long id_utente) {
		 	return bookRepository.findByUser(id_utente);
	} 
	
	public int countReadBooks(boolean read, Long userid) {
	 	return bookRepository.countReadBooks(read, userid);
	} 
	
	public int insertBookReading(Long userId ,Long bookId, Boolean read) {
	 	return bookRepository.insertBookReading(userId,bookId, read);
        
	}
	public int removeBookReading(Long userId ,Long bookId ) {
	 	return bookRepository.removeBookReading(userId,bookId);
        
	}
	public int updateBookReading(Long bookId, boolean read) {	     
	     return bookRepository.updateBookReading(bookId, read);
	 }
	

}
