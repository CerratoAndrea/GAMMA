package com.its.bookhub.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.its.bookhub.model.Book;
import com.its.bookhub.model.User;
import com.its.bookhub.service.BookService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomepageController {
	
	@Autowired
	BookService bookService;
	
    @GetMapping("/homepage")
    public String homepage(ModelMap model, 
    					   HttpSession session, 
    					   @RequestParam(required = false) String title, 
    					   @RequestParam(required = false) String author){
    	System.out.println("Hompage");
    	User user = (User)session.getAttribute("user");
    	List<Book> books = new ArrayList<Book>();
    	
    	if(isEmpty(author) && isEmpty(title)) {
    		System.out.println("findALL");
    		 books = bookService.findAll(user.getId());    	
    	}
    	else if(!isEmpty(author) && !isEmpty(title)){
    		System.out.println("Autore e libro= "+title+" "+author);
    		 books = bookService.findByAuthorAndTitle(author, title, user.getId());    	
           
    	}
    	else if(isEmpty(author) && !isEmpty(title)) {
    		System.out.println("Libro= "+title);
    		books = bookService.findByTitle(title, user.getId()); 
    	}
    	else {
    		System.out.println("Autore= "+author);
    		books = bookService.findByAuthor(author, user.getId());    	        
    	}
    	
    	model.put("libBooks", books);
    	
    	int bookCountRead = bookService.countReadBooks(true, user.getId() );
    	int bookCountReading = bookService.countReadBooks(false, user.getId());
    	
    	model.put("bookRead", bookCountRead);
    	model.put("bookReading", bookCountReading);
    	
        List<Book> myBooks = bookService.findByUser(user.getId());
        
        model.put("myBooks", myBooks);

        System.out.println("fine homepage");
        return "homepage";
    }
    
    @PostMapping("/add_book")
    public String booksAdd(ModelMap model, 
			   				HttpSession session, 
			   				@RequestParam(required = true) Long bookId){
    	
    	User user = (User)session.getAttribute("user");
    	bookService.insertBookReading(user.getId() ,bookId, false);
    	
    	
    	return homepage(model, session, null, null);
    }
    
    @PostMapping("/remove_book")
    public String booksRemove(ModelMap model, 
			   				HttpSession session, 
			   				@RequestParam(required = true) Long bookId){
    	
    	User user = (User)session.getAttribute("user");
    	bookService.removeBookReading(user.getId() ,bookId);
    	
    	
    	return homepage(model, session, null, null);
    }
    
    @PostMapping("/read_book")
    public String booksRead(ModelMap model, 
			   				HttpSession session, 
			   				@RequestParam(required = true) Long bookId){
    	
    	User user = (User)session.getAttribute("user");
    	bookService.updateBookReading(bookId, true);
    	
    	
    	return homepage(model, session, null, null);
   
    }
    
    private boolean isEmpty(String value) {
    	if(value == null || value.trim().equals("")) {
    		return true;
    	}
    	return false;
    }
    	
}
