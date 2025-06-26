package com.its.bookhub.model;

public class UserRank {
	
	Long id;
	String username;
	int points;
	int booksRead;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public int getBooksRead() {
		return booksRead;
	}
	public void setBooksRead(int booksRead) {
		this.booksRead = booksRead;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	
	
}
