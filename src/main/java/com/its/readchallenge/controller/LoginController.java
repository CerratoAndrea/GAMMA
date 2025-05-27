package com.its.readchallenge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.its.readchallenge.model.User;
import com.its.readchallenge.service.LoginService;

@Controller
@SessionAttributes("name")
public class LoginController {

    @Autowired
    LoginService service;

    @GetMapping("/")
    public String showLoginPage(ModelMap model){
        return "loginPage";
    }

    @PostMapping("/login")
    public String showWelcomePage(ModelMap model, @RequestParam String name, @RequestParam String password){

    	try {
	        User user = service.validateUser(name, password);
	        
	        model.put("user", user);
	
	        return "homepage";
    	}
    	catch(EmptyResultDataAccessException e) {
    		model.put("errorMessage", "Credenziali errati");
            return "loginPage";
    	}
    }
   
}
