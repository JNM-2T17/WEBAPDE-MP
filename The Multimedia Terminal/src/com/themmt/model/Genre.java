package com.themmt.model;

public class Genre {
	public static final String TITLE_COLUMN = "title";
	public static final String GENRE_COLUMN = "genre";
	public static final String ISVERIFIED_COLUMN = "isVerified";
	public static final String TITLECLASS_COLUMN = "titleclass";
	
	private String genre;
	private String title;
	private boolean isVerified;
	private String titleclass;
	
	public Genre(String genre, String title, boolean isVerified, String titleclass) {
		this.genre = genre;
		this.title = title;
		this.isVerified = isVerified;
		this.titleclass = titleclass;
	}	
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isVerified() {
		return isVerified;
	}

	public void setVerified(boolean isVerified) {
		this.isVerified = isVerified;
	}

	public String getTitleclass() {
		return titleclass;
	}

	public void setTitleclass(String titleclass) {
		this.titleclass = titleclass;
	}

}
