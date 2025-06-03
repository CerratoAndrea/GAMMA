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

import com.its.bookhub.model.Book;
import com.its.bookhub.service.LoginService;

@Controller
public class HomepageController {

    @GetMapping("/homepage")
    public String homepage(ModelMap model){
    	System.out.println("homepage");
        
        Book b1 = new Book();
        b1.setAuthor("George Orwell");
        b1.setImage("1984.jpg");
        b1.setTitle("1984");
        
        Book b2 = new Book();
        b2.setAuthor("Dante Alighieri");
        b2.setImage("divina_commedia.jpg");
        b2.setTitle("La divina commedia");
        
        Book b3 = new Book();
        b3.setAuthor("Umberto Eco");
        b3.setImage("il_nome_della_rosa.jpg");
        b3.setTitle("Il nome della rosa");
        
        Book b4 = new Book();
        b4.setAuthor("Francis Scott Fitzgerald");
        b4.setImage("The_Great_Gatsby.jpg");
        b4.setTitle("Il grande Gatsby");
        
        List<Book> books = new ArrayList<Book>();
        books.add(b1);
        books.add(b2);
        books.add(b3);
        books.add(b4);
        books.add(b4);
        books.add(b3);
        books.add(b1);
        books.add(b2); 
        books.add(b1);
        books.add(b2);
        books.add(b3);
        books.add(b4);
        
        model.put("libBooks", books);
        
        List<Book> myBooks = new ArrayList<Book>();
        myBooks.add(b1);
        myBooks.add(b2);
        
        model.put("myBooks", myBooks);

        System.out.println("fine homepage");
        return "homepage";
    }

}
