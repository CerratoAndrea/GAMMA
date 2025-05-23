package com.its.readchallenge.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Challenge {

	private int id_challenge; 
	private String name;
	private String description;
	private Date start_date;
	private Date end_date;
	private List<User> challengeList = new ArrayList<User>();
	private List<Book> bookListread = new ArrayList<Book>();
	
	
	//Getters e setter della Challenge
	public int getId_challenge() {
		return id_challenge;
	}
	public void setId_challenge(int id_challenge) {
		this.id_challenge = id_challenge;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
}
