package com.themmt.model;

public class Review {
	public static final String TITLE_COLUMN = "title";
	public static final String USERNAME_COLUMN = "username";
	public static final String REVIEW_COLUMN = "review";
	public static final String TITLECLASS_COLUMN = "titleclass";
	public static final String ISFLAGGED_COLUMN = "isFlagged";
	
	private String title;
	private String username;
	private String review;
	private boolean isFlagged;
	private String titleclass;
	
	public Review(String username, String title, String review, boolean isFlagged, String titleclass) {
		this.title = title;
		this.username = username;
		this.review = review;
		this.isFlagged = isFlagged;
		this.titleclass = titleclass;
	}

	public String getReview() {
		return review;
	}

	public String getTitle() {
		return title;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getTitleClass() {
		return titleclass;
	}
	
	public boolean getIsFlagged(){
		return isFlagged;
	}
	
	public void setIsFlagged(){
		this.isFlagged = isFlagged;
	}
	
	public void setReview(String review) {
		this.review = review;
	}
}
