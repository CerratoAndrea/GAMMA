package com.its.bookhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.its.bookhub.repository.UserRepository;

@Service
public class LoginService {
	
	@Autowired
    private UserRepository userRepository;

    public boolean validateUser(String userid, String password) {
    	System.out.println("validateUser");
    	//System.out.println("count: "+userRepository.countUsers());
    	
        // Utente di prova
        return userid.equalsIgnoreCase("test") && password.equalsIgnoreCase("test");
    }

}
