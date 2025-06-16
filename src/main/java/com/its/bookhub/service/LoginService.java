package com.its.bookhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.its.bookhub.model.User;
import com.its.bookhub.repository.UserRepository;

@Service
public class LoginService {
	
	@Autowired
    private UserRepository userRepository;

    public User validateUser(String username, String password) {
    	System.out.println("validateUser");
    	
    	User user = userRepository.findByNameAndpassowrd(username, password);
    	
        return user;
        		
    }

}
