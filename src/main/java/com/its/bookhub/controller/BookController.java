package com.its.bookhub.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.its.bookhub.BookHubApplication;
import com.its.bookhub.model.Book;
import com.its.bookhub.model.User;
import com.its.bookhub.service.BookService;
import com.its.bookhub.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BookController {

    private final BookHubApplication bookHubApplication;
    
	@Autowired
	BookService bookService;

    BookController(BookHubApplication bookHubApplication) {
        this.bookHubApplication = bookHubApplication;
    }
	
    @GetMapping("/manageBook")
    public String manageBook(ModelMap model,
    		                 HttpSession session){
    	System.out.println("manageBook");
        
    	User user = (User)session.getAttribute("user");
    	
    	List<Book> books = bookService.findAllDeletable(); 
        
        model.put("libBooks", books);

        System.out.println("fine manageBook");
        return "manageBook";
    }
    
    @PostMapping("/addBook")
    public String addBook(ModelMap model,
    		              HttpSession session,
    		              @RequestParam String title, 
    		              @RequestParam String author, 
    		              @RequestParam String year, 
    		              @RequestParam Integer pages, 
    		              @RequestParam String image, 
    		              @RequestParam String type, 
    		              @RequestParam String summary){
    	
    	System.out.println("book title "+title);
    	System.out.println("book author "+author);
    	System.out.println("book pages "+pages);
    	System.out.println("book image "+image);
    	System.out.println("book type "+type);
    	System.out.println("book summary "+summary);
    	
    	bookService.addBook(title, author, image, type, summary, year, pages);
    	
    	return manageBook(model, session);
    }
    
    @PostMapping("/deleteBook")
    public String deleteBook(ModelMap model,
    		                 HttpSession session,
    		                 @RequestParam int id){
    	
    	System.out.println(id);
    	Long bookIdLong = Long.valueOf(id);
    	bookService.deleteBook(bookIdLong);
    	
    	return manageBook(model, session);
    }

}
