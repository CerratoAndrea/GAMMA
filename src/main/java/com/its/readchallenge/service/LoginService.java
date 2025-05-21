package com.its.readchallenge.service;

import org.springframework.stereotype.Service;

@Service
public class LoginService {

    public boolean validateUser(String userid, String password) {
        // Utente di prova
        return userid.equalsIgnoreCase("test") && password.equalsIgnoreCase("test");
    }

}
