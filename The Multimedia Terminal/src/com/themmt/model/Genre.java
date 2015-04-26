package com.themmt.model;

public class Genre {
	public static final String TITLE_COLUMN = "title";
	public static final String GENRE_COLUMN = "genre";
	public static final String ISVERIFIED_COLUMN = "isVerified";
	public static final String TITLECLASS_COLUMN = "titleclass";
	
	private String genre;
	private String title;
	private boolean verified;
	private String titleclass;
	
	public Genre() {
		super();
	}

	public Genre(String genre, String title, boolean isVerified, String titleclass) {
		this.genre = genre;
		this.title = title;
		this.verified = isVerified;
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
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}

	public String getTitleclass() {
		return titleclass;
	}

	public void setTitleclass(String titleclass) {
		this.titleclass = titleclass;
	}

}
