package com.themmt.model;

public class User {
	public static final String USERNAME_COLUMN = "username";
	public static final String FNAME_COLUMN = "fname";
	public static final String LNAME_COLUMN = "lname";
	public static final String GENDER_COLUMN = "gender";
	public static final String EMAIL_COLUMN = "email";
	public static final String PASSWORD_COLUMN = "password";
	public static final String PROFPIC_COLUMN = "profpic";
	public static final String DESCRIPTION_COLUMN = "description";
	public static final String FLAG_COLUMN = "isFlagged";
	public static final String ADMIN_COLUMN = "adminName";
	
	private String username;
	private String fname;
	private String lname;
	private String gender;
	private String email;
	private String password;
	private String profpic;
	private String description;
	private boolean flagged;
	private boolean isAdmin;
	
	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public User() {
		super();
	}

	public User( String username, String fname, String lname, String gender,
				 String email, String password, String profpic, String description, 
				 boolean flagged ) {
		super();
		this.username = username;
		this.fname = fname;
		this.lname = lname;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.profpic = profpic;
		this.description = description;
		this.flagged = flagged;
		this.isAdmin= false;
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
	
	public boolean isFlagged() {
		return flagged;
	}
	
	public void setFlagged(boolean flagged) {
		this.flagged = flagged;
	}


}
