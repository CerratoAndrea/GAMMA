package com.its.readchallenge.model;

import java.sql.Date;


public class Challenge {
	
	private int id ;
	private String title;
	private String description;
	private Date startDate;
	private Date endDate;


	
	
	//Getters e setter della Challenge
	public int getId_challenge() {
		return id;
	}
	public void setId_challenge(int id_challenge) {
		this.id = id;
	}
	public String getName() {
		return title;
	}
	public void setName(String name) {
		this.title = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStart_date() {
		return startDate;
	}
	public void setStart_date(Date start_date) {
		this.startDate = start_date;
	}
	public Date getEnd_date() {
		return endDate;
	}
	public void setEnd_date(Date end_date) {
		this.endDate = end_date;
	}
	

}
