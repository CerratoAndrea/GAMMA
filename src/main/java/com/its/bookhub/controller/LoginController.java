package com.its.bookhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.its.bookhub.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    LoginService service;
    
    @Autowired
    HomepageController homepageController;

    @GetMapping("/")
    public String showLoginPage(ModelMap model){
        return "loginPage";
    }

    @PostMapping("/login")
    public String login(ModelMap model, HttpSession session, @RequestParam String name, @RequestParam String password){
    	System.out.println("login");
        boolean isValidUser = service.validateUser(name, password);

        if (!isValidUser) {
            model.put("errorMessage", "Credenziali errate");            
            return "loginPage";
        }

        session.setAttribute("username", name);
        
        return homepageController.homepage(model);
    }
    
    @GetMapping("/logout")
    public String logout(){
    	System.out.println("logout");
        
        return "loginPage";
    }

}
