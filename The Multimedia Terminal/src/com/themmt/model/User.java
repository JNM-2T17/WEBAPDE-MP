package com.themmt.model;

public class User {
	private String username;
	private String fname;
	private String lname;
	private String gender;
	private String email;
	private String password;
	private String profpic;
	private String description;
	private int isFlagged;
	
	public User()
	{
		super();
		
		
	}

public User(String username, String fname, String lname, String gender,
		String email, String password, String profpic, String description, int isFlagged
		) {
	super();
	this.username = username;
	this.fname = fname;
	this.lname = lname;
	this.gender = gender;
	this.email = email;
	this.password = password;
	this.profpic = profpic;
	this.description = description;
	this.isFlagged = isFlagged;
}
	
	
	
	
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getProfpic() {
		return profpic;
	}
	public void setProfpic(String profpic) {
		this.profpic = profpic;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getIsFlagged() {
		return isFlagged;
	}
	public void setIsFlagged(int isFlagged) {
		this.isFlagged = isFlagged;
	}


}
