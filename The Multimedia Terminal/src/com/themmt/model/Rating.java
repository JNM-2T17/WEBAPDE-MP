package com.themmt.model;

public class Rating {
	public static final String TITLE_COLUMN = "title";
	public static final String USERNAME_COLUMN = "username";
	public static final String RATING_COLUMN = "rating";
	public static final String TITLECLASS_COLUMN = "titleclass";
	
	private String title;
	private String username;
	private double rating;
	private String titleclass;
	
	public Rating(String title, String username, double rating, String titleclass) {
		this.title = title;
		this.username = username;
		this.rating = rating;
		this.titleclass = titleclass;
	}

	public double getRating() {
		return rating;
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
	
	public void setRating(double rating) {
		this.rating = rating;
	}
}
