package com.its.readchallenge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.its.readchallenge.controller.LoginController;
import com.its.readchallenge.model.User;
import com.its.readchallenge.repository.UserRepository;

@Service
public class LoginService {
	
	@Autowired
	UserRepository userRepository;
	
	
    public User validateUser(String username, String password) {
        User user = userRepository.findByusernamePassword(username, password);
        test(user);
        return user;
    }
    
    private void test(User user) {
    	try {
    		System.out.println("count= "+userRepository.countUsers());
        	List<User> lista = userRepository.findAll();
        	for (User user2 : lista) {
    			System.out.println(user2.getUsername());
    			System.out.println(user2.getId());
    		}
        	
    	
        	System.out.println(userRepository.findById(user.getId()));
        	user.setEmail("Bianchi");
        	user.setUsername("Giovanni");
        	//System.out.println("inseriti= "+userRepository.insert(user));
        	user.setEmail("Gialli");
        	user.setUsername("federico");
        	System.out.println("aggiornati= "+userRepository.update(user));
        	System.out.println("cancellati= "+userRepository.deleteById(user.getId()));
    	}
    	catch(Exception e){
    		System.out.println(e);
    	}
    	
    }
}
