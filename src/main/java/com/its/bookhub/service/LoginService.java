package com.its.bookhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.its.bookhub.model.User;
import com.its.bookhub.repository.UserRepository;

@Service
public class LoginService {
	
	@Autowired
    private UserRepository userRepository;

    public User validateUser(String userid, String password) {
    	System.out.println("validateUser");
    	//System.out.println("count: "+userRepository.countUsers());
    	
        // Utente di prova
    	
    	boolean logOk = userid.equalsIgnoreCase("test") && password.equalsIgnoreCase("test");
    	if(logOk == true) {
    		User user = new User();
    		user.setName("test");
    		user.setPassword(password);
    		user.setId(Long.valueOf("2"));
    		user.setEmail("ciro");
    		return user;
    	}
        return null;
        		
    }

}
