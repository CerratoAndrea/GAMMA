package com.its.bookhub.model;

import java.sql.Date;


public class Challenge {
	
	private long id ;
	private String title;
	private String description;
	private Date startDate;
	private Date endDate;
	private boolean chPartecipation;
	private int numUsers;
	
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public boolean getChPartecipation() {
		return chPartecipation;
	}
	public void setChPartecipation(boolean chPartecipation) {
		this.chPartecipation = chPartecipation;
	}
	public int getNumUsers() {
		return numUsers;
	}
	public void setNumUsers(int numUsers) {
		this.numUsers = numUsers;
	}


	

}
