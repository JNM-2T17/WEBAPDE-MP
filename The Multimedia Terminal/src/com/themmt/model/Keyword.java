package com.themmt.model;

public class Keyword {
	public static final String KEYWORD_COLUMN = "keyword";
	public static final String TITLE_COLUMN = "title";
	public static final String ISVERIFIED_COLUMN = "isVerified";
	public static final String TITLECLASS_COLUMN = "titleclass";
	
	private String keyword;
	private String title;
	private boolean isVerified;
	private String titleclass;
	
	public Keyword(String keyword, String title, boolean isVerified, String titleclass) {
		this.keyword = keyword;
		this.title = title;
		this.isVerified = isVerified;
		this.titleclass = titleclass;
	}	
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
