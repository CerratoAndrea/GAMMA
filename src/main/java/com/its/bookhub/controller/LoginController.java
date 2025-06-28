package com.its.bookhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.its.bookhub.model.User;
import com.its.bookhub.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    LoginService service;
    
    @Autowired
    HomepageController homepageController;
    
    @Autowired
    BookController bookController;

    @GetMapping("/")
    public String showLoginPage(ModelMap model){
        return "loginPage";
    }

    @PostMapping("/login")
    public String login(ModelMap model, 
    		            HttpSession session, 
    		            @RequestParam String name, 
    		            @RequestParam String password){
    	System.out.println("login");
        User user = service.validateUser(name, password);        
        
        if (user == null) {
            model.put("errorMessage", "Credenziali errate");            
            return "loginPage";
        }

        session.setAttribute("user", user);        

        if(user.getType().equals("admin"))
        	return bookController.manageBook(model, session);
        else
        	return homepageController.homepage(model, session, null, null);
    }
    
    @GetMapping("/logout")

    public String logout(HttpSession session){
    	System.out.println("logout");
    	session.invalidate();

        return "loginPage";
    }

    

    @GetMapping("/register")
    public String register(ModelMap model){
    	
        return "registerPage";
    }
    
    @PostMapping("/registerUser")
    public String register(ModelMap model, 
    		 			   @RequestParam String name, 
    		 			   @RequestParam String email, 
    		 			   @RequestParam(name = "create-password") String password){
    	
    	User user = new User();
    	user.setName(name);
    	user.setEmail(email);
    	user.setPassword(password);
    	
    	service.saveUser(user);
        return "loginPage";
    }
    
    @PostMapping("/saveProfile")
    public String saveProfile(ModelMap model, 
    						HttpSession session, 
    		 			   @RequestParam String name,
    		 			   @RequestParam Long id,
    		 			   @RequestParam String email, 
    		 			   @RequestParam(name = "create-password") String password,
    		 			   @RequestParam String type){
    	
    	User user = new User();
    	user.setName(name);
    	user.setEmail(email);
    	user.setPassword(password);
    	user.setId(id);
    	user.setType(type);
    	
    	service.updateUser(user);
    	
    	session.setAttribute("user", user);  
    	if(user.getType().equals("admin"))
        	return bookController.manageBook(model, session);
        else
        	return homepageController.homepage(model, session, null, null);
    }
    
    @GetMapping("/user-profile")
    public String userProfile(ModelMap model){
    	
        return "user-profile";
    }
    
}
