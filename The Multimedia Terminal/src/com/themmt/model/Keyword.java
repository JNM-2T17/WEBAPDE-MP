package com.themmt.model;

public class Keyword {
	public static final String KEYWORD_COLUMN = "keyword";
	public static final String TITLE_COLUMN = "work";
	public static final String ISVERIFIED_COLUMN = "isVerified";
	public static final String TITLECLASS_COLUMN = "workclass";
	
	private String keyword;
	private String title;
	private boolean verified;
	private String titleclass;
	
	public Keyword() {
		super();
	}

	public Keyword(String keyword, String title, boolean isVerified, String titleclass) {
		this.keyword = keyword;
		this.title = title;
		this.verified = isVerified;
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
