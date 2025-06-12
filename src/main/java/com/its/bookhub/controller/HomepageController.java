package com.its.bookhub.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.its.bookhub.model.Book;
import com.its.bookhub.model.User;
import com.its.bookhub.repository.BookRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomepageController {
	
	@Autowired
	BookRepository bookRepository;
	
    @GetMapping("/homepage")
    public String homepage(ModelMap model, HttpSession session, @RequestParam String title, @RequestParam String author){
    	System.out.println("Hompage");
    	List<Book> books = new ArrayList<Book>();
    	
    	if(isEmpty(author) && isEmpty(title)) {
    		 books = bookRepository.findAll();    	
    	}
    	else if(!isEmpty(author) && !isEmpty(title)){
    		 books = bookRepository.findByAuthorAndTitle(author, title);    	
           
    	}
    	else if(isEmpty(author) && !isEmpty(title)) {
    		 books = bookRepository.findByAuthor(author);    	
            
    	}
    	else {
    		 books = bookRepository.findByTitle(title);    	
           
    	}
    	
    	
    	model.put("libBooks", books);
    	
//    	User user = (User)session.getAttribute("user");
//    	
//    	int bookCountRead = bookRepository.countReadBooks(true, user.getId() );
//    	int bookCountReading = bookRepository.countReadBooks(false, user.getId());
//    	
//    	model.put("bookRead", bookCountRead);
//    	model.put("bookReading", bookCountReading);
//    	
//        List<Book> myBooks = bookRepository.findByUser(user.getId());
//        
//        model.put("myBooks", myBooks);
//
//        System.out.println("fine homepage");
        return "homepage";
    }
    
    private boolean isEmpty(String value) {
    	if(value == null || value.trim().equals("")) {
    		return true;
    	}
    	return false;
    }
    
    	
    	
    	
}
