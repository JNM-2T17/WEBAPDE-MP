package com.themmt.model;

public class WorkRecommendation {

	public static final String USERNAME_COLUMN = "username";
	public static final String WORKFROM_COLUMN = "workFrom";
	public static final String WORKTO_COLUMN = "workTo";
	public static final String ISREC_COLUMN = "isRec";
	public static final String WORKFROMCLASS_COLUMN = "workFromClass";
	public static final String WORKTOCLASS_COLUMN = "workToClass";
	
	private String username;
	private String workFrom;
	private String workTo;
	private int isRec;
	private String workFromClass;
	private String workToClass;
	
	public WorkRecommendation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public WorkRecommendation(String username, String workFrom, String workTo,
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
