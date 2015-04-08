package com.themmt.model;

public class Recommendation {

	private String username;
	private String workFrom;
	private String workTo;
	private int isRec;
	private String workFromClass;
	private String workToClass;
		
	
	
	
	
	public Recommendation() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Recommendation(String username, String workFrom, String workTo,
			int isRec, String workFromClass, String workToClass) {
		super();
		this.username = username;
		this.workFrom = workFrom;
		this.workTo = workTo;
		this.isRec = isRec;
		this.workFromClass = workFromClass;
		this.workToClass = workToClass;
	}
	
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getWorkFrom() {
		return workFrom;
	}
	public void setWorkFrom(String workFrom) {
		this.workFrom = workFrom;
	}
	public String getWorkTo() {
		return workTo;
	}
	public void setWorkTo(String workTo) {
		this.workTo = workTo;
	}
	public int getIsRec() {
		return isRec;
	}
	public void setIsRec(int isRec) {
		this.isRec = isRec;
	}
	public String getWorkFromClass() {
		return workFromClass;
	}
	public void setWorkFromClass(String workFromClass) {
		this.workFromClass = workFromClass;
	}
	public String getWorkToClass() {
		return workToClass;
	}
	public void setWorkToClass(String workToClass) {
		this.workToClass = workToClass;
	}
	
	
	
	
}
