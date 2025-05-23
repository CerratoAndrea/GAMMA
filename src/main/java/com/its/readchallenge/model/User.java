package com.its.readchallenge.model;



import java.util.ArrayList;
import java.util.List;

public class User {

	private int idUser;
	private String name; 
	private String email;
	private String password;
	private int score;
	private List<Challenge> challengeList = new ArrayList<Challenge>();
	private List<Book> bookListread = new ArrayList<Book>();
	private List<Book> bookListReading = new ArrayList<Book>();
	

	//Getters e setters dell'utente
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setId_user(int id_user) {
		this.idUser = id_user;
	}
	
}


